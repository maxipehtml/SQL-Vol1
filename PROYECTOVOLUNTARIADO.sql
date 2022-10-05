CREATE DATABASE IF NOT EXISTS proyecto_voluntariados;

USE proyecto_voluntariados;



CREATE TABLE IF NOT EXISTS nacionalidad(
	idNacionalidad INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    pais VARCHAR(100) NOT NULL,
    otras VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS requisitos(
	idRequisitos INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    requisitos VARCHAR(500) NOT NULL
);

CREATE TABLE IF NOT EXISTS descripciones(
	idDescripcion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(500) NOT NULL
);

CREATE TABLE IF NOT EXISTS localidad(
	idLocalidad INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ciudad VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL,
    codPostal VARCHAR(40)
);

CREATE TABLE IF NOT EXISTS valoraciones(
	idValoracion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    reseña VARCHAR(500) NOT NULL,
    valor INT NOT NULL
);

CREATE TABLE IF NOT EXISTS anfitrion(
	idAnfitrion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(70) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    celular INT NOT NULL,
    redSocial VARCHAR(100),
    idLocalidad INT,
    FOREIGN KEY (idLocalidad) REFERENCES localidad(idLocalidad),
    direccion VARCHAR(200),
    idNacionalidad INT,
    FOREIGN KEY (idNacionalidad) REFERENCES nacionalidad(idNacionalidad),
    idValoracion INT,
	FOREIGN KEY (idValoracion) REFERENCES valoraciones(idValoracion)
);
CREATE TABLE IF NOT EXISTS capacitaciones(
	idCapacitacion INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    idDescripcion INT,
    FOREIGN KEY (idDescripcion) REFERENCES descripciones(idDescripcion),
	idRequisitos INT,
    FOREIGN KEY (idRequisitos) REFERENCES requisitos(idRequisitos),
	idAnfitrion INT,
    FOREIGN KEY (idAnfitrion) REFERENCES anfitrion(idAnfitrion),
    idLocalidad INT,
    FOREIGN KEY (idLocalidad) REFERENCES localidad(idLocalidad),
	idValoracion INT,
	FOREIGN KEY (idValoracion) REFERENCES valoraciones(idValoracion)
);

CREATE TABLE IF NOT EXISTS voluntario(
	idVoluntario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(70) NOT NULL,
    fechaNacimiento DATE NOT NULL,
    celular INT NOT NULL,
    redSocial VARCHAR(100),
    idLocalidad INT,
    FOREIGN KEY (idLocalidad) REFERENCES localidad(idLocalidad),
    direccion VARCHAR(200),
	idDescripcion INT,
    FOREIGN KEY (idDescripcion) REFERENCES descripciones(idDescripcion),
	idNacionalidad INT,
    FOREIGN KEY (idNacionalidad) REFERENCES nacionalidad(idNacionalidad),
	idValoracion INT,
	FOREIGN KEY (idValoracion) REFERENCES valoraciones(idValoracion),
    idCapacitacion INT,
    FOREIGN KEY (idCapacitacion) REFERENCES capacitaciones(idCapacitacion)
);


CREATE TABLE IF NOT EXISTS pedidos(
	idPedido INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    EstadiaMinima VARCHAR(50),
    EstadiaMaxima VARCHAR(50),
	idDescripcion INT,
    FOREIGN KEY (idDescripcion) REFERENCES descripciones(idDescripcion),
	idRequisitos INT,
    FOREIGN KEY (idRequisitos) REFERENCES requisitos(idRequisitos),
    beneficios VARCHAR(400),
    idAnfitrion INT,
    FOREIGN KEY (idAnfitrion) REFERENCES anfitrion(idAnfitrion),
	idLocalidad INT,
    FOREIGN KEY (idLocalidad) REFERENCES localidad(idLocalidad)
);

