const express = require('express');
const app = express();

const port = process.env.PORT || 3000;
const host = process.env.HOST || "http://localhost";

app.get('/test', (req, res) => {
    res.send('API is working!');
    });

app.listen(port, () => {
    console.log(`API is running on ${host}:${port}`);
});