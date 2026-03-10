DROP DATABASE IF EXISTS lavado_vehicular;
--BD
CREATE DATABASE lavado_vehicular;
USE lavado_vehicular;

DELIMITER $$

DROP PROCEDURE IF EXISTS create_tables $$
CREATE PROCEDURE create_tables()
BEGIN

    -- MÓDULO DE SEGURIDAD

    CREATE TABLE Rol (
        id_rol INT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL,
        descripcion VARCHAR(255)
    );

    CREATE TABLE Permiso (
        id_permiso INT PRIMARY KEY,
        nombre VARCHAR(150) NOT NULL,
        descripcion VARCHAR(300)
    );

    CREATE TABLE Usuario (
        id_usuario BIGINT PRIMARY KEY,  -- documento
        nombre VARCHAR(100) NOT NULL,
        correo VARCHAR(150) NOT NULL UNIQUE,
        contrasena VARCHAR(255) NOT NULL,
        telefono VARCHAR(20),
        activo BOOLEAN DEFAULT TRUE,
        fecha_creacion DATE DEFAULT (CURRENT_DATE)
    );

    CREATE TABLE Usuario_Rol (
        id_usuario BIGINT,
        id_rol INT,
        rol_principal BOOLEAN,
        PRIMARY KEY (id_usuario, id_rol),
        FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
        FOREIGN KEY (id_rol) REFERENCES Rol(id_rol)
    );

    CREATE TABLE Permiso_Rol (
        id_rol INT,
        id_permiso INT,
        PRIMARY KEY (id_rol, id_permiso),
        FOREIGN KEY (id_rol) REFERENCES Rol(id_rol),
        FOREIGN KEY (id_permiso) REFERENCES Permiso(id_permiso)
    );

    -- OPERACIONAL

    CREATE TABLE Zona (
        id_zona INT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        ciudad VARCHAR(100),
        activo BOOLEAN DEFAULT TRUE
    );

    CREATE TABLE Sucursal (
        id_sucursal INT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        direccion VARCHAR(200),
        telefono VARCHAR(20),
        ciudad VARCHAR(100),
        id_zona INT,
        FOREIGN KEY (id_zona) REFERENCES Zona(id_zona)
    );

    CREATE TABLE Servicio (
        id_servicio INT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        descripcion VARCHAR(255),
        precio DECIMAL(10,2)
    );

    CREATE TABLE Vehiculo (
        id_vehiculo INT PRIMARY KEY,
        id_usuario BIGINT,
        placa VARCHAR(15) UNIQUE,
        marca VARCHAR(50),
        modelo VARCHAR(50),
        tipo VARCHAR(50),
        FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
    );

    CREATE TABLE Operario (
        id_operario INT PRIMARY KEY,
        id_usuario BIGINT,
        especialidad VARCHAR(100),
        estado BOOLEAN,
        calificacion DECIMAL(3,2),
        FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
    );

    CREATE TABLE Operario_Zona (
        id_operario INT,
        id_zona INT,
        turno VARCHAR(50),
        activo BOOLEAN,
        PRIMARY KEY (id_operario, id_zona),
        FOREIGN KEY (id_operario) REFERENCES Operario(id_operario),
        FOREIGN KEY (id_zona) REFERENCES Zona(id_zona)
    );

    CREATE TABLE Reserva (
        id_reserva INT PRIMARY KEY,
        id_usuario BIGINT,
        id_vehiculo INT,
        id_sucursal INT,
        fecha DATETIME,
        estado VARCHAR(30),
        observaciones VARCHAR(500),
        total DECIMAL(10,2),
        FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
        FOREIGN KEY (id_vehiculo) REFERENCES Vehiculo(id_vehiculo),
        FOREIGN KEY (id_sucursal) REFERENCES Sucursal(id_sucursal)
    );

    CREATE TABLE Reserva_Servicio (
        id_reserva INT,
        id_servicio INT,
        cantidad INT DEFAULT 1,
        precio_unitario DECIMAL(10,2),
        duracion_min INT,
        PRIMARY KEY (id_reserva, id_servicio),
        FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
        FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
    );

    CREATE TABLE Asignacion (
        id_asignacion INT PRIMARY KEY,
        id_reserva INT,
        id_operario INT,
        estado VARCHAR(50),
        fecha_asignacion DATETIME,
        FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
        FOREIGN KEY (id_operario) REFERENCES Operario(id_operario)
    );

    CREATE TABLE Calificacion (
        id_calificacion INT PRIMARY KEY,
        id_reserva INT,
        id_usuario BIGINT,
        id_operario INT,
        puntuacion INT,
        comentario VARCHAR(255),
        fecha DATETIME,
        FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
        FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
        FOREIGN KEY (id_operario) REFERENCES Operario(id_operario)
    );

    -- COMERCIAL

    CREATE TABLE Promocion (
        id_promocion INT PRIMARY KEY,
        nombre VARCHAR(100),
        porcentaje DECIMAL(5,2),
        valor DECIMAL(10,2),
        fecha_inicio DATE,
        fecha_fin DATE,
        activo BOOLEAN DEFAULT TRUE
    );

    CREATE TABLE Aplica_Promo (
        id_aplica INT PRIMARY KEY,
        id_reserva INT,
        id_promocion INT,
        FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva),
        FOREIGN KEY (id_promocion) REFERENCES Promocion(id_promocion)
    );

    CREATE TABLE Pago (
        id_pago INT PRIMARY KEY,
        id_reserva INT,
        monto DECIMAL(10,2),
        metodo VARCHAR(50),
        referencia VARCHAR(100),
        estado_pago VARCHAR(50),
        fecha_pago DATETIME,
        FOREIGN KEY (id_reserva) REFERENCES Reserva(id_reserva)
    );

END $$
DELIMITER ;

CALL create_tables();