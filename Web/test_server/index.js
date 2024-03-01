import express from "express";

const app = express();

const port = 3000;

app.get("/api/hello", (req, res) => {
    console.log("Hello from server");
    res.status(200).send("Hello from server");
})

app.get("/api/hello/:name", (req, res) => {
    console.log(req.params);
    res.status(200).send(`Hello ${req.params.name}`)
})

app.listen(port, () => {
    console.log(`Listening on port ${port}`);
});


