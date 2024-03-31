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
----------------------------------------------------------------------------
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
----------------------------------------------------------------------------
create table tipos_genero(
    id int auto_increment not null primary key,
    abreviacion varchar(3),
    descripcion varchar(50)
);
insert into tipos_genero(abreviacion,descripcion)
	values("M", "Masculino");
insert into tipos_genero(abreviacion,descripcion)
	values("F", "Femenino"); 
-------------------------------------------------------------------------------