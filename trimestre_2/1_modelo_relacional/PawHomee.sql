create database PawHome; 
show databases;
use PawHome; 
----------------------------------------------------------------------------------------
create table adoptiongiver(
	id int auto_increment not null,
    id_tipoDocumento int,
    numero_documento bigint,
    nombres varchar (60),
    apellidos varchar (60),
    fecha_nacimiento varchar (30),
    email varchar (60),
    celular varchar (11),
    id_tipoSangre int, 
    id_tipoGenero int, 
    antecedentes bigint, 
    direccion varchar (60),
    primary key(id), 
    foreign key(id_tipoDocumento) references tipos_documentos(id),
    foreign key(id_tipoSangre) references tipos_sangre(id),
    foreign key(id_tipoGenero) references tipos_genero(id)
); 

create table adopter(
	id int auto_increment not null,
    id_tipoDocumento int,
    numero_documento bigint,
    nombres varchar (60),
    apellidos varchar (60),
    fecha_nacimiento varchar (30),
    email varchar (60),
    celular varchar (11),
    id_tipoSangre int, 
    id_tipoGenero int, 
    antecedentes bigint, 
    direccion varchar (60),
    primary key(id), 
    foreign key(id_tipoDocumento) references tipos_documentos(id),
    foreign key(id_tipoSangre) references tipos_sangre(id),
    foreign key(id_tipoGenero) references tipos_genero(id)
); 

create table pets(
	id int auto_increment not null, 
    id_tipoMascota int, 
    id_tipoRaza int, 
    id_tipogeneroMascota int, 
    condicion_saludMascota int, 
    nombre_mascota varchar (60), 
    comportamiento_mascota int, 
    historia_mascota int, 
    peso_mascota varchar (10), 
    id_tamañoMascota int, 
    id_colorMascota int, 
    altura_mascota varchar (20), 
    fecha_nacimientoMascota varchar (20), 
    id_tiposangreMascota int,
    primary key(id), 
    foreign key(id_tipoMascota) references tipos_mascotas(id),
    foreign key(id_tipoRaza) references tipos_razasMascotas(id),
    foreign key(id_tipogeneroMascota) references tipos_generoMascotas(id),
    foreign key(id_tamañoMascota) references tipos_tamañoMascotas(id),
    foreign key(id_colorMascota) references tipos_colorMascotas(id),
    foreign key(id_tiposangreMascota) references tipos_sangreMascotas(id)
);
--------------------------------------------------------------------------------
create table tipos_documentos(
    id int auto_increment not null primary key,
    abreviacion varchar(3),
    descripcion varchar(50)
);
insert into tipos_documentos(abreviacion,descripcion)
	values("CC", "Cedula de Ciudadania");
insert into tipos_documentos(abreviacion,descripcion)
	values("TI", "Tarjeta de Identidad");
insert into tipos_documentos(abreviacion,descripcion)
	values("CE", "Cedula de Extranjeria");
insert into tipos_documentos(abreviacion,descripcion)
	values("PP", "Pasaporte");
insert into tipos_documentos(abreviacion,descripcion)
	values("RCN", "Registro Civil de Nacimiento");
insert into tipos_documentos(abreviacion,descripcion)
	values("TRE", "Tarjeta de Registro de Extranjeria");
insert into tipos_documentos(abreviacion,descripcion)
	values("DNI", "Documento Nacional de Identidad");
insert into tipos_documentos(abreviacion,descripcion)
	values("PRP", "Permiso de Residencia Permanente");
------------------------------------------------------------------------------------
create table tipos_sangre( 
    id int auto_increment not null primary key,
    abreviacion varchar(3),
    descripcion varchar(50)
); 
insert into tipos_sangre(abreviacion,descripcion)
	values("O+", "O positivo");
insert into tipos_sangre(abreviacion,descripcion)
	values("O-", "O negativo");
insert into tipos_sangre(abreviacion,descripcion)
	values("A+", "A positivo");
insert into tipos_sangre(abreviacion,descripcion)
	values("A-", "A negativo");
insert into tipos_sangre(abreviacion,descripcion)
	values("B+", "B positivo");
insert into tipos_sangre(abreviacion,descripcion)
	values("B-", "B negativo");
insert into tipos_sangre(abreviacion,descripcion)
	values("AB+", "AB positivo");
insert into tipos_sangre(abreviacion,descripcion)
	values("AB-", "AB negativo");
---------------------------------------------------------------------------------------
create table tipos_genero(
    id int auto_increment not null primary key,
    abreviacion varchar(3),
    descripcion varchar(50)
);
insert into tipos_genero(abreviacion,descripcion)
	values("M", "Masculino");
insert into tipos_genero(abreviacion,descripcion)
	values("F", "Femenino");
--------------------------------------------------------------------------------------
create table tipos_mascotas(
    id int auto_increment not null primary key,
    abreviacion varchar(3),
    descripcion varchar(50)
);
insert into tipos_mascotas(abreviacion,descripcion)
	values("P", "Perro");
insert into tipos_mascotas(abreviacion,descripcion)
	values("G", "Gato");
----------------------------------------------------------------------------------------
create table tipos_razasMascotas(
    id int auto_increment not null primary key,
    abreviacion varchar(10),
    descripcion varchar(50)
);
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("LR_P", "Labrador Retriever");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("PA_P", "Pastor Alemán");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("BD_P", "Bulldog");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("GR_P", "Golden Retriever");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("BG_P", "Beagle");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("PD_P", "Poodle");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("CH_P", "Chihuahua");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("YT_P", "Yorkshire Terrier");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("BX_P", "Boxer");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("DH_P", "Dachshund");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("SM_G", "Siamés");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("MC_G", "Maine Coon");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("PR_G", "Persa");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("BG_G", "Bengalí");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("SP_G", "Sphynx");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("RG_G", "Ragdoll");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("BS_G", "British Shorthair");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("SF_G", "Scottish Fold");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("RB_G", "Russian Blue");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("PH_G", "Persa Himalayo");
insert into tipos_razasMascotas(abreviacion,descripcion)
	values("AB_G", "Abisinio");
-----------------------------------------------------------------------------------------
create table tipos_generoMascotas(
    id int auto_increment not null primary key,
    abreviacion varchar(3),
    descripcion varchar(50)
);
insert into tipos_generoMascotas(abreviacion,descripcion)
	values("M", "Macho");
insert into tipos_generoMascotas(abreviacion,descripcion)
	values("H", "Hembra");
------------------------------------------------------------------------------------------
create table tipos_tamañoMascotas(
    id int auto_increment not null primary key,
    abreviacion varchar(3),
    descripcion varchar(50)
);
insert into tipos_tamañoMascotas(abreviacion,descripcion)
	values("P", "Pequeño");
insert into tipos_tamañoMascotas(abreviacion,descripcion)
	values("M", "Mediano");
insert into tipos_tamañoMascotas(abreviacion,descripcion)
	values("G", "grande");
------------------------------------------------------------------------------------------
create table tipos_colorMascotas(
    id int auto_increment not null primary key,
    abreviacion varchar(10),
    descripcion varchar(50)
);
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
insert into tipos_colorMascotas(abreviacabreviacionion,descripcion)
	values("MR-BL", "Marron y Blanco");
insert into tipos_colorMascotas(abreviacion,descripcion)
	values("NG-MR", "Negro y Marron");
---------------------------------------------------------------------------------------------
create table tipos_sangreMascotas(
    id int auto_increment not null primary key,
    abreviacion varchar(10),
    descripcion varchar(50)
);
insert into tipos_sangreMascotas(abreviacion,descripcion)
	values("DEA 1.1+", "DEA 1.1 positivo");
insert into tipos_sangreMascotas(abreviacion,descripcion)
	values("DEA 1.1-", "DEA 1.1 negativo");
insert into tipos_sangreMascotas(abreviacion,descripcion)
	values("DEA 4+", "DEA 4 positivo");
insert into tipos_sangreMascotas(abreviacion,descripcion)
	values("DEA 4-", "DEA 4 negativo");
insert into tipos_sangreMascotas(abreviacion,descripcion)
	values("DEA 3+", "DEA 3 positivo");
insert into tipos_sangreMascotas(abreviacion,descripcion)
	values("DEA 3-", "DEA 3 negativo");
-----------------------------------------------------------------------------------------------

SELECT * FROM `adoptiongiver`;
UPDATE `adoptiongiver` SET `id_tipoSangre` = '1' WHERE `adoptiongiver`.`id` = 1; 
UPDATE `adoptiongiver` SET `id_tipoSangre` = '5' WHERE `adoptiongiver`.`id` = 2; 
UPDATE `adoptiongiver` SET `id_tipoSangre` = '4' WHERE `adoptiongiver`.`id` = 3; 
UPDATE `adoptiongiver` SET `id_tipoSangre` = '1' WHERE `adoptiongiver`.`id` = 4; 
UPDATE `adoptiongiver` SET `id_tipoSangre` = '5' WHERE `adoptiongiver`.`id` = 5;

ALTER TABLE pets
MODIFY COLUMN condicion_saludMascota VARCHAR(60),
MODIFY COLUMN comportamiento_mascota VARCHAR(60),
MODIFY COLUMN historia_mascota VARCHAR(60);

alter table tipos_colorMascotas
modify column abreviacion varchar(10); 












