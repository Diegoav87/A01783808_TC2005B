import express, { json } from "express";

const app = express();

const port = 3000;

app.use(express.json())

app.get("/api/hello", (req, res) => {
    console.log("Hello from server");
    res.status(200).send("Hello from server");
})

app.get("/api/hello/:name", (req, res) => {
    console.log(req.params);
    res.status(200).send(`Hello ${req.params.name}`)
})

app.get("/api/hello/:name/:surname", (req, res) => {
    console.log(req.params);
    res.status(200).send(`Hello ${req.params.name} ${req.params.surname}`)
})

app.post("/api/hello", (req, res) => {
    console.log(req.body);
    res.status(200).send(`Hello ${req.body.name} ${req.body.surname}`)
})

app.listen(port, () => {
    console.log(`Listening on port ${port}`);
});


