const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');
const path = require('path');

const app = express();
const port = 3000;

app.use(cors());

// 🔧 Servir archivos estáticos del frontend
app.use(express.static(path.join(__dirname, '..', 'frontend')));

// Configuración de conexión MySQL
const conexion = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: 'root',
  database: 'SUBNAUTICA'
});

conexion.connect(err => {
  if (err) {
    console.error('Error de conexión a MySQL:', err);
    return;
  }
  console.log('Conexión a MySQL exitosa');
});

// Ruta para obtener datos desde la base
app.get('/api/Object', (req, res) => {
  conexion.query('SELECT * FROM Object', (err, resultados) => {
    if (err) {
      console.error(err);
      res.status(500).send('Error al consultar la base de datos');
      return;
    }
    res.json(resultados);
  });
});

app.get('/api/Type', (req, res) => {
  conexion.query('SELECT * FROM Type', (err, resultados) => {
    if (err) {
      console.error(err);
      res.status(500).send('Error al consultar la base de datos');
      return;
    }
    res.json(resultados);
  });
});

app.get('/api/Sprite', (req, res) => {
  conexion.query('SELECT * FROM Sprite', (err, resultados) => {
    if (err) {
      console.error(err);
      res.status(500).send('Error al consultar la base de datos');
      return;
    }
    res.json(resultados);
  });
});

// Ruta para obtener un sprite específico por ID
app.get('/api/Sprite/:id', (req, res) => {
  const spriteId = parseInt(req.params.id, 10);
  conexion.query('SELECT Path FROM Sprite WHERE ID = ?', [spriteId], (err, resultados) => {
    if (err) {
      console.error(err);
      return res.status(500).send('Error al consultar la base de datos');
    }
    if (resultados.length === 0) {
      return res.status(404).send('Sprite no encontrado');
    }
    res.json(resultados[0]); // { Path: "ruta_del_sprite.png" }
  });
});

// Escuchar en el puerto
app.listen(port, () => {
  console.log(`Servidor Express en http://localhost:${port}`);
});