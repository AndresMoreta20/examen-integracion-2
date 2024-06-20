const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors"); // Importar el paquete CORS
const db = require("./db");

const app = express();

app.use(cors()); // Usar el middleware CORS
app.use(bodyParser.json());

app.post("/facturas", (req, res) => {
  const { orden_id, total } = req.body;
  db.query(
    "INSERT INTO facturas (orden_id, total) VALUES (?, ?)",
    [orden_id, total],
    (err, result) => {
      if (err) throw err;
      res.send("Factura creada");
    }
  );
});

app.get("/facturas", (req, res) => {
  db.query("SELECT * FROM facturas", (err, result) => {
    if (err) throw err;
    res.json(result);
  });
});

app.get("/facturas/:id", (req, res) => {
  const { id } = req.params;
  db.query("SELECT * FROM facturas WHERE id = ?", [id], (err, result) => {
    if (err) throw err;
    res.json(result);
  });
});

app.listen(4000, () => {
  console.log("Invoice service running on port 4000");
});
