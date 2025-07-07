CREATE DATABASE SmartParking;
USE SmartParking;

CREATE TABLE Usuario (
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50),
    Correo VARCHAR(100) UNIQUE,
    Contraseña VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20)
);

CREATE TABLE Vehiculo (
    idVehiculo INT AUTO_INCREMENT PRIMARY KEY,
    Placa VARCHAR(20) NOT NULL UNIQUE,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Color VARCHAR(30),
    idUsuario INT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Estacionamiento (
    idEstacionamiento INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(200),
    TotalLugares INT
);

CREATE TABLE Lugar (
    idLugar INT AUTO_INCREMENT PRIMARY KEY,
    Numero INT NOT NULL,
    Estado ENUM('Libre', 'Ocupado', 'Reservado') DEFAULT 'Libre',
    idEstacionamiento INT NOT NULL,
    FOREIGN KEY (idEstacionamiento) REFERENCES Estacionamiento(idEstacionamiento)
);

CREATE TABLE Reserva (
    idReserva INT AUTO_INCREMENT PRIMARY KEY,
    idVehiculo INT NOT NULL,
    idLugar INT NOT NULL,
    FechaReserva DATE NOT NULL,
    HoraInicio TIME,
    HoraFin TIME,
    FOREIGN KEY (idVehiculo) REFERENCES Vehiculo(idVehiculo),
    FOREIGN KEY (idLugar) REFERENCES Lugar(idLugar)
);

CREATE TABLE Pago (
    idPago INT AUTO_INCREMENT PRIMARY KEY,
    idReserva INT NOT NULL,
    Monto DECIMAL(10,2) NOT NULL,
    Metodo ENUM('Efectivo', 'Tarjeta', 'Transferencia', 'App') NOT NULL,
    FechaPago DATE NOT NULL,
    FOREIGN KEY (idReserva) REFERENCES Reserva(idReserva)
);
