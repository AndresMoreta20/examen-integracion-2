-- Script para crear la base de datos de órdenes
CREATE DATABASE IF NOT EXISTS my_shopping_orders;
USE my_shopping_orders;

DROP TABLE IF EXISTS ordenes;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS productos;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    email VARCHAR(255),
    direccion VARCHAR(255)
);

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    imagen_url VARCHAR(255),
    stock INT
);

CREATE TABLE ordenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    cantidad INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Poblar la tabla productos con los datos iniciales
INSERT INTO productos (nombre, imagen_url, stock) VALUES 
('bulbasaur', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png', 10),
('ivysaur', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png', 15),
('venusaur', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png', 5),
('charmander', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png', 20),
('charmeleon', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png', 8),
('charizard', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png', 12),
('squirtle', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png', 25),
('wartortle', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png', 15),
('blastoise', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png', 10),
('caterpie', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png', 30),
('metapod', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/11.png', 25),
('butterfree', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/12.png', 5),
('weedle', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/13.png', 20),
('kakuna', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/14.png', 15),
('beedrill', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/15.png', 10),
('pidgey', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/16.png', 30),
('pidgeotto', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/17.png', 20),
('pidgeot', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/18.png', 15),
('rattata', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/19.png', 25),
('raticate', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/20.png', 10);

-- Script para crear la base de datos compartida
CREATE DATABASE IF NOT EXISTS my_shopping_shared;
USE my_shopping_shared;

DROP TABLE IF EXISTS facturas;
DROP TABLE IF EXISTS productos;

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    imagen_url VARCHAR(255),
    stock INT
);

CREATE TABLE facturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    orden_id INT,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2)
);

-- Poblar la tabla productos con los mismos datos que la base de datos de órdenes de compra
INSERT INTO productos (nombre, imagen_url, stock) VALUES 
('bulbasaur', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png', 10),
('ivysaur', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png', 15),
('venusaur', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png', 5),
('charmander', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png', 20),
('charmeleon', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png', 8),
('charizard', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png', 12),
('squirtle', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png', 25),
('wartortle', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/8.png', 15),
('blastoise', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/9.png', 10),
('caterpie', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/10.png', 30),
('metapod', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/11.png', 25),
('butterfree', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/12.png', 5),
('weedle', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/13.png', 20),
('kakuna', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/14.png', 15),
('beedrill', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/15.png', 10),
('pidgey', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/16.png', 30),
('pidgeotto', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/17.png', 20),
('pidgeot', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/18.png', 15),
('rattata', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/19.png', 25),
('raticate', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/20.png', 10);
