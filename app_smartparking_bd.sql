-- Crear base de datos
CREATE DATABASE IF NOT EXISTS smartparking_db;
USE smartparking_db;

-- Tabla de usuarios (modo usuario o administrador)
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    tipo ENUM('usuario', 'administrador') DEFAULT 'usuario'
);

-- Tabla de espacios de estacionamiento
CREATE TABLE espacios (
    id_espacio INT AUTO_INCREMENT PRIMARY KEY,
    ubicacion VARCHAR(150) NOT NULL,
    disponible BOOLEAN DEFAULT TRUE
);

-- Tabla de reservas
CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_espacio INT,
    fecha_reserva DATE,
    horas INT,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_espacio) REFERENCES espacios(id_espacio)
);

-- Tabla de pagos
CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    horas INT NOT NULL,
    total INT NOT NULL,
    metodo ENUM('Tarjeta', 'Efectivo') NOT NULL,
    codigo_efectivo VARCHAR(10), -- Solo si es en efectivo
    fecha_pago TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Tabla de notificaciones
CREATE TABLE notificaciones (
    id_notificacion INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    mensaje TEXT NOT NULL,
    enviada BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva)
);
