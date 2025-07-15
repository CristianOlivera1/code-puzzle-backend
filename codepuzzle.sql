CREATE TABLE rol (
    idRol        char(36) PRIMARY KEY,
    nombre      VARCHAR(50)
);
-- Tabla: Usuario
CREATE TABLE usuario (
    idUsuario        char(36) PRIMARY KEY,
    idRol           char(36),
    nombre           VARCHAR(50),
    correo           VARCHAR(100) UNIQUE,
    contrasena       VARCHAR(255),
    foto           VARCHAR(255),
    fechaRegistro    DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idRol) REFERENCES rol(idRol)
);


-- Tabla: Categoria
CREATE TABLE categoria (
    idCategoria      char(36) PRIMARY KEY,
    nombre           VARCHAR(50),
    foto           VARCHAR(255)
);

-- Tabla: Nivel
CREATE TABLE nivel (
    idNivel          char(36) PRIMARY KEY,
    idCategoria      char(36),
    titulo           VARCHAR(100),
    tiempoLimite    int,                     -- tiempo límite en segundos
    ayudaDescripcion TEXT,
    FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

-- Tabla: ProgresoUsuario
CREATE TABLE progresoUsuario (
    idProgresoUsuario char(36) PRIMARY KEY,
    idUsuario         char(36),
    idNivel           char(36),
    estrellas         INT CHECK (estrellas BETWEEN 0 AND 3),
    tiempoSegundos    INT,                             -- tiempo total empleado
    FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
    FOREIGN KEY (idNivel)    REFERENCES Nivel(idNivel)
);

-- Tabla: BloqueCodigo
CREATE TABLE bloqueCodigo (
    idBloqueCodigo   char(36) PRIMARY KEY,
    idNivel          char(36),
    contenido        TEXT,
    ordenCorrecto    INT,                     -- posición correcta
    FOREIGN KEY (idNivel) REFERENCES Nivel(idNivel)
);