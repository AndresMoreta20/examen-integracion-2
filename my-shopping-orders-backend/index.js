const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const db = require("./db");
const csvWriter = require("csv-writer").createObjectCsvWriter;

const app = express();

app.use(cors());
app.use(bodyParser.json());

app.post("/ordenes", (req, res) => {
  const { cliente_nombre, producto_id, cantidad } = req.body;

  // Primero, insertar el cliente si no existe
  db.query(
    "INSERT INTO clientes (nombre) VALUES (?) ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id)",
    [cliente_nombre],
    (err, result) => {
      if (err) throw err;

      const cliente_id = result.insertId;

      // Luego, insertar la orden con el cliente_id obtenido
      db.query(
        "INSERT INTO ordenes (cliente_id, producto_id, cantidad) VALUES (?, ?, ?)",
        [cliente_id, producto_id, cantidad],
        (err, result) => {
          if (err) throw err;
          res.send("Order created");
        }
      );
    }
  );
});

app.get("/ordenes", (req, res) => {
  db.query(
    "SELECT o.id, c.nombre AS cliente_nombre, p.nombre AS producto_nombre, o.cantidad, o.fecha FROM ordenes o LEFT JOIN clientes c ON o.cliente_id = c.id LEFT JOIN productos p ON o.producto_id = p.id",
    (err, result) => {
      if (err) throw err;
      res.json(result);
    }
  );
});

app.post("/ordenes/csv", (req, res) => {
  db.query(
    "SELECT id, cliente_id, producto_id, cantidad, fecha FROM ordenes",
    (err, rows) => {
      if (err) throw err;
      const csv = csvWriter({
        path: "nuevas_ordenes.csv",
        header: [
          { id: "id", title: "id" },
          { id: "cliente_id", title: "cliente_id" },
          { id: "producto_id", title: "producto_id" },
          { id: "cantidad", title: "cantidad" },
          { id: "fecha", title: "fecha" },
        ],
      });
      csv.writeRecords(rows).then(() => res.send("CSV generated"));
    }
  );
});

app.listen(3000, () => {
  console.log("Order service running on port 3000");
});
