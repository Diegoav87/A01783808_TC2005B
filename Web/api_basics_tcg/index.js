import express from "express";

const app = express();

const port = 3000;

app.use(express.json())

let cards = [{
    id: 1,
    name: "French Soldier",
    description: "A french soldier with a rifle."
},
{
    id: 2,
    name: "Julius Caesar",
    description: "A great roman emperor."
}];

const properties = ["id", "name", "description"];

// Obtener todas las cartas
app.get("/api/cards", (req, res) => {

    if (cards.length === 0) {
        res.status(200).json({ message: "No hay cartas" })
    }

    res.status(200).json(cards);
})

// Obtener una carta
app.get("/api/cards/:id", (req, res) => {

    const id = parseInt(req.params.id);

    const foundCard = cards.find(card => card.id === id);


    if (foundCard) {
        res.status(200).json(foundCard);
    } else {
        res.status(404).send({ message: "No se encontró la carta" });
    }
})

// Borrar carta
app.delete("/api/cards/:id", (req, res) => {

    const id = parseInt(req.params.id);

    const index = cards.findIndex(card => card.id === id);


    if (index !== -1) {
        cards = cards.filter(card => card.id !== id);
        res.status(200).json({ message: "Carta borrada" });
    } else {
        res.status(404).send({ message: "No se encontró la carta" });
    }
})

// Crear nuevas cartas
app.post("/api/cards", (req, res) => {
    const data = req.body;

    data.forEach(card => {
        if (card.hasOwnProperty("id") && card.hasOwnProperty("name") && card.hasOwnProperty("description")) {

            Object.keys(card).forEach(key => {
                if (!properties.includes(key)) {
                    res.status(400).json({ message: "Propiedades inválidas" })
                }
            })

            const exists = cards.some(item => item.id === card.id);

            if (exists) {
                res.status(400).json({ message: "La carta ya existe" })
            } else {
                cards.push(card);
            }
        } else {
            res.status(400).json({ message: "A la carta le hacen falta propiedades" })
        }
    })

    res.status(200).json(cards);
})

// Actualizar carta
app.put("/api/cards/:id", (req, res) => {
    const id = parseInt(req.params.id);
    const card = req.body;

    Object.keys(card).forEach(key => {
        if (!properties.includes(key)) {
            res.status(400).json({ message: "Propiedades inválidas" })
        }
    })

    const foundCard = cards.find(card => card.id === id);

    if (foundCard) {
        const updatedCard = {
            ...foundCard,
            ...card
        }

        const newCards = cards.filter(card => card.id !== id);
        newCards.push(updatedCard);
        cards = [...newCards];
        res.status(200).send(newCards);

    } else {
        res.status(404).send({ message: "No se encontró la carta" });
    }

})

app.listen(port, () => {
    console.log(`Listening on port ${port}`);
});