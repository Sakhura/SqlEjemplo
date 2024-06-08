-- BASE DE DATO CON INSTRUCCCIONES // ES SOLO A MODO DE EJEMPLO

-- Crear base de datos
CREATE DATABASE nombre_de_tu_base_de_datos;

-- Usar base de datos
USE nombre_de_tu_base_de_datos;

-- Crear tablas  
-- Ahora puedes crear tablas dentro de tu base de datos. Por ejemplo, vamos a crear dos tablas: empleados y departamentos.

CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    salario DECIMAL(10, 2),
    departamento_id INT
);

CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- Insertar datos: Ahora insertaremos algunos datos en nuestras tablas.
INSERT INTO departamentos (nombre) VALUES ('Ventas'), ('Marketing'), ('TI');

INSERT INTO empleados (nombre, salario, departamento_id) VALUES
    ('Juan', 3000, 1),
    ('María', 3500, 2),
    ('Pedro', 4000, 3),
    ('Laura', 3200, 1);

-- Consultas con JOIN: Ahora, veamos algunas consultas que involucran JOIN para combinar datos de múltiples tablas.
-- Consulta 1: Obtener el nombre del empleado y el nombre del departamento al que pertenece

SELECT empleados.nombre AS nombre_empleado, departamentos.nombre AS nombre_departamento
FROM empleados
INNER JOIN departamentos ON empleados.departamento_id = departamentos.id;

-- Consulta 2: Obtener el nombre del departamento y la cantidad de empleados que pertenecen a cada departamento.

SELECT departamentos.nombre AS nombre_departamento, COUNT(empleados.id) AS cantidad_empleados
FROM departamentos
LEFT JOIN empleados ON departamentos.id = empleados.departamento_id
GROUP BY departamentos.id;

-- ver tablas que exiten

SHOW TABLES;

-- ver la estructura de una tabla usamos el comando "describe" junto al nombre de la tabla:

DESCRIBE empleados;

-- Para eliminar una tabla usamos "drop table". Tipeamos:

DROP TABLE nombre_de_tabla;

-- TIPOS DE DATOS EN BASE DE DATOS

-- Numéricos
-- INT: Entero, puede ser unsigned o signed.
-- FLOAT: Número decimal, puede ser unsigned o signed.
-- DECIMAL: Número decimal con precisión y escala definidas.
-- BIT: Número entero que puede tener un valor de 0 o 1.

-- Fecha y Hora
-- DATE: Fecha, en formato YYYY-MM-DD.
-- TIME: Hora, en formato HH:MM:SS.
-- DATETIME: Fecha y hora, en formato YYYY-MM-DD HH:MM:SS.
-- TIMESTAMP: Fecha y hora, en formato YYYY-MM-DD HH:MM:SS, con zona horaria.
-- YEAR: Año, en formato YYYY.

-- Cadenas de Caracteres
-- CHAR: Cadena de caracteres de longitud fija.
-- VARCHAR: Cadena de caracteres de longitud variable.
-- TEXT: Cadena de caracteres de longitud variable, utilizado para almacenar texto grande.
-- ENUM: Cadena de caracteres que puede tener un valor entre una lista de opciones definidas.
-- SET: Cadena de caracteres que puede tener varios valores entre una lista de opciones definidas.

-- Otros
-- BLOB: Almacenamiento de datos binarios, como imágenes o archivos.
-- JSON: Almacenamiento de datos en formato JSON.

-- EJEMPLO DE CREACION DE TABLAS CON DISTINTOS TIPOS DE DATOS
CREATE TABLE empleados (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  fecha_nacimiento DATE,
  hora_entrada TIME
);

CREATE TABLE productos (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  precio DECIMAL(10, 2),
  fecha_creacion TIMESTAMP
);

CREATE TABLE configuracion (
  id INT PRIMARY KEY,
  valor ENUM('si', 'no'),
  descripcion TEXT
);

