-- Tabla: Usuarios
CREATE TABLE Usuarios (
    idUsuarios INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45),
    correo VARCHAR(100) UNIQUE,
    contraseña VARCHAR(100),
    fecha_de_registro DATE
);

-- Tabla: Estacionamiento
CREATE TABLE Estacionamiento (
    idEstacionamiento INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45),
    direccion VARCHAR(100),
    latitud DECIMAL(10,7),
    longitud DECIMAL(10,7)
);

-- Tabla: Espacios
CREATE TABLE Espacios (
    idEspacios INT AUTO_INCREMENT PRIMARY KEY,
    idEstacionamiento INT,
    numero VARCHAR(10),
    disponibles BOOLEAN DEFAULT TRUE,
    tipo VARCHAR(45),
    FOREIGN KEY (idEstacionamiento) REFERENCES Estacionamiento(idEstacionamiento)
);

-- Tabla: Reservas
CREATE TABLE Reservas (
    idReservas INT AUTO_INCREMENT PRIMARY KEY,
    monto DECIMAL(10,2),
    metodo_pago VARCHAR(45),
    fecha_pago DATE,
    Usuarios_idUsuarios INT,
    FOREIGN KEY (Usuarios_idUsuarios) REFERENCES Usuarios(idUsuarios)
);

-- Tabla: Pagos
CREATE TABLE Pagos (
    idPagos INT AUTO_INCREMENT PRIMARY KEY,
    id_reserva INT,
    monto DECIMAL(10,2),
    metodo_pago VARCHAR(45),
    fecha_pago DATE,
    FOREIGN KEY (id_reserva) REFERENCES Reservas(idReservas)
);
