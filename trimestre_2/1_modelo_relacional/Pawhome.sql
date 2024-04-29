create database PawHome; 
show databases;
use PawHome; 
--------------------------------------------------------------------------------------------------------
CREATE TABLE tipos_documentos (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    abreviacion VARCHAR(3),
    descripcion VARCHAR(50)
);

CREATE TABLE tipos_sangre (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    abreviacion VARCHAR(3),
    descripcion VARCHAR(50)
);

CREATE TABLE tipos_genero (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    abreviacion VARCHAR(3),
    descripcion VARCHAR(50)
);

CREATE TABLE tipos_mascotas (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    abreviacion VARCHAR(3),
    descripcion VARCHAR(50)
);

CREATE TABLE tipos_razasmascotas (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    abreviacion VARCHAR(10),
    descripcion VARCHAR(50),
    id_tipoMascota INT,
    FOREIGN KEY (id_tipoMascota) REFERENCES tipos_mascotas(id)
);

create table tipos_colorMascotas(
    id int auto_increment not null primary key,
    abreviacion varchar(10),
    descripcion varchar(50)
);

CREATE TABLE tipos_sangremascotas (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    abreviacion VARCHAR(10),
    descripcion VARCHAR(50),
    id_tipoMascota INT,
    FOREIGN KEY (id_tipoMascota) REFERENCES tipos_mascotas(id)
);

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_tipoDocumento INT,
    numero_documento BIGINT,
    nombres VARCHAR(60),
    apellidos VARCHAR(60),
    fecha_nacimiento VARCHAR(30),
    email VARCHAR(60),
    celular VARCHAR(11),
    id_tipoSangre INT,
    id_tipoGenero INT,
    antecedentes VARCHAR(100),
    direccion VARCHAR(60),
    id_rol INT,
    FOREIGN KEY (id_tipoDocumento) REFERENCES tipos_documentos(id),
    FOREIGN KEY (id_tipoSangre) REFERENCES tipos_sangre(id),
    FOREIGN KEY (id_tipoGenero) REFERENCES tipos_genero(id),
    FOREIGN KEY (id_rol) REFERENCES roles(id)
);

CREATE TABLE pets (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_tipoMascota INT,
    id_tipoRaza INT,
    genero VARCHAR (20),
    condicion_saludMascota VARCHAR(60),
    nombre_mascota VARCHAR(60),
    comportamiento_mascota VARCHAR(60),
    historia_mascota VARCHAR(60),
    peso_mascota VARCHAR(10),
    id_colorMascota INT,
    altura_mascota VARCHAR(20),
    fecha_nacimientoMascota VARCHAR(20),
    id_tiposangreMascota INT,
    id_dueño INT,
    FOREIGN KEY (id_tipoMascota) REFERENCES tipos_mascotas(id),
    FOREIGN KEY (id_tipoRaza) REFERENCES tipos_razasmascotas(id),
    FOREIGN KEY (id_colorMascota) REFERENCES tipos_colormascotas(id),
    FOREIGN KEY (id_tiposangreMascota) REFERENCES tipos_sangremascotas(id),
    FOREIGN KEY (id_dueño) REFERENCES usuarios(id)
);

create table info_usuarios(
	id int auto_increment not null primary key,
    email varchar (60) not null unique,
    contraseña varchar (30)
); 

CREATE TABLE intentos_login (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    email VARCHAR(60),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    exitoso BOOLEAN,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE sesiones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    token VARCHAR(255),
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    activa BOOLEAN,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

CREATE TABLE roles (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
); 
--------------------------------------------------------------------------------------------------------
INSERT INTO tipos_documentos (abreviacion, descripcion) VALUES
    ('CC', 'Cedula de Ciudadania'),
    ('TI', 'Tarjeta de Identidad'),
    ('CE', 'Cedula de Extranjeria'),
    ('PP', 'Pasaporte'),
    ('RCN', 'Registro Civil de Nacimiento'),
    ('TRE', 'Tarjeta de Registro de Extranjeria'),
    ('DNI', 'Documento Nacional de Identidad'),
    ('PRP', 'Permiso de Residencia Permanente');

INSERT INTO tipos_sangre (abreviacion, descripcion) VALUES
    ('O+', 'O positivo'),
    ('O-', 'O negativo'),
    ('A+', 'A positivo'),
    ('A-', 'A negativo'),
    ('B+', 'B positivo'),
    ('B-', 'B negativo'),
    ('AB+', 'AB positivo'),
    ('AB-', 'AB negativo');

INSERT INTO tipos_genero (abreviacion, descripcion) VALUES
    ('M', 'Masculino'),
    ('F', 'Femenino');

INSERT INTO roles (nombre) VALUES
    ('Administrador'),
    ('Usuario');

INSERT INTO tipos_mascotas (abreviacion, descripcion) VALUES
    ('P', 'Perro'),
    ('G', 'Gato');

INSERT INTO tipos_razasmascotas (abreviacion, descripcion, id_tipoMascota) VALUES
-- razas de perros
    ('LR_P', 'Labrador Retriever', 1),
    ('PA_P', 'Pastor Alemán', 1),
    ("BD_P", "Bulldog", 1), 
	("GR_P", "Golden Retriever", 1),
	("BG_P", "Beagle", 1),
	("PD_P", "Poodle", 1),
	("CH_P", "Chihuahua", 1),
	("YT_P", "Yorkshire Terrier", 1),
	("BX_P", "Boxer", 1),
	("DH_P", "Dachshund", 1),
-- razas de gatos
    ('SM_G', 'Siamés', 2),
    ('MC_G', 'Maine Coon', 2), 
	("PR_G", "Persa", 2),
	("BG_G", "Bengalí", 2),
	("SP_G", "Sphynx", 2),
	("RG_G", "Ragdoll", 2),
	("BS_G", "British Shorthair", 2),
	("SF_G", "Scottish Fold", 2),
	("RB_G", "Russian Blue", 2),
	("PH_G", "Persa Himalayo", 2),
	("AB_G", "Abisinio", 2);

insert into tipos_colorMascotas(abreviacion,descripcion)
	values("BL", "Blanco");
insert into tipos_colorMascotas(abreviacion,descripcion)
	values("NG", "Negro");
insert into tipos_colorMascotas(abreviacion,descripcion)
	values("MR", "Marron");
insert into tipos_colorMascotas(abreviacion,descripcion)
	values("GR", "Gris");
insert into tipos_colorMascotas(abreviacion,descripcion)
	values("DR", "Dorado");
insert into tipos_colorMascotas(abreviacion,descripcion)
	values("AT", "Atigrado");
insert into tipos_colorMascotas(abreviacion,descripcion)
	values("NG-BL", "Negro y Blanco");
insert into tipos_colorMascotas(abreviacion,descripcion)
	values("MR-BL", "Marron y Blanco");
insert into tipos_colorMascotas(abreviacion,descripcion)
	values("NG-MR", "Negro y Marron");

INSERT INTO tipos_sangremascotas (abreviacion, descripcion, id_tipoMascota) VALUES
-- sangre de perros
    ('DEA 1.1+', 'DEA 1.1 positivo', 1),
    ('DEA 1.1-', 'DEA 1.1 negativo', 1),
    ('DEA 1.2+', 'DEA 1.2 positivo', 1),
    ('DEA 1.2-', 'DEA 1.2 negativo', 1),
	("DEA 3+", "DEA 3 positivo", 1),
	("DEA 3-", "DEA 3 negativo", 1),
    ("DEA 4+", "DEA 4 positivo", 1),
	("DEA 4-", "DEA 4 negativo", 1),
    ("DEA 5+", "DEA 5 positivo", 1),
	("DEA 5-", "DEA 5 negativo", 1),
    ("DEA 7+", "DEA 7 positivo", 1),
	("DEA 7-", "DEA 7 negativo", 1),
    
-- sangre de gatos
    ('A+', 'A positivo', 2),
    ('A-', 'A negativo', 2),
    ('B+', 'B positivo', 2),  
    ('B-', 'B negativo', 2),  
    ('AB+', 'AB positivo', 2),   
    ('AB-', 'AB negativo', 2);   

----------------------------------------------------------------------------------------
alter table usuarios add foreign key (email) references info_usuarios(email);



