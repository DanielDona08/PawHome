from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager


class InfoUsuarios(AbstractBaseUser):
    email = models.EmailField(unique=True, max_length=60)
    password = models.CharField(max_length=128, blank=True, null=True)

    USERNAME_FIELD = 'email'

    class Meta:
        managed = True
        db_table = 'info_usuarios'

    def __str__(self):
        return self.email


class Mascotas(models.Model):
    id_tipomascota = models.ForeignKey('TiposMascotas', models.DO_NOTHING, db_column='id_tipoMascota', blank=True, null=True)
    id_tiporaza = models.ForeignKey('TiposRazasmascotas', models.DO_NOTHING, db_column='id_tipoRaza', blank=True, null=True)
    foto = models.CharField(max_length=255, blank=True, null=True)
    genero = models.CharField(max_length=20, blank=True, null=True)
    condicion_saludmascota = models.CharField(db_column='condicion_saludMascota', max_length=60, blank=True, null=True)
    nombre_mascota = models.CharField(max_length=60, blank=True, null=True)
    comportamiento_mascota = models.CharField(max_length=60, blank=True, null=True)
    historia_mascota = models.CharField(max_length=60, blank=True, null=True)
    peso_mascota = models.CharField(max_length=10, blank=True, null=True)
    id_colormascota = models.ForeignKey('TiposColormascotas', models.DO_NOTHING, db_column='id_colorMascota', blank=True, null=True)
    altura_mascota = models.CharField(max_length=20, blank=True, null=True)
    fecha_nacimientomascota = models.DateField(db_column='fecha_nacimientoMascota', blank=True, null=True)
    id_tiposangremascota = models.ForeignKey('TiposSangremascotas', models.DO_NOTHING, db_column='id_tiposangreMascota', blank=True, null=True)
    id_dueño = models.ForeignKey('Usuarios', models.DO_NOTHING, db_column='id_dueño', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'mascotas'


class Roles(models.Model):
    nombre = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'roles'


class Sesiones(models.Model):
    id_usuario = models.ForeignKey('Usuarios', models.DO_NOTHING, db_column='id_usuario', blank=True, null=True)
    token = models.CharField(max_length=255, blank=True, null=True)
    fecha_creacion = models.DateTimeField()
    activa = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sesiones'


class TiposColormascotas(models.Model):
    abreviacion = models.CharField(max_length=10, blank=True, null=True)
    descripcion = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipos_colormascotas'


class TiposDocumentos(models.Model):
    abreviacion = models.CharField(max_length=3, blank=True, null=True)
    descripcion = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipos_documentos'


class TiposGenero(models.Model):
    abreviacion = models.CharField(max_length=3, blank=True, null=True)
    descripcion = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipos_genero'


class TiposMascotas(models.Model):
    abreviacion = models.CharField(max_length=3, blank=True, null=True)
    descripcion = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipos_mascotas'


class TiposRazasmascotas(models.Model):
    abreviacion = models.CharField(max_length=10, blank=True, null=True)
    descripcion = models.CharField(max_length=50, blank=True, null=True)
    id_tipomascota = models.ForeignKey(TiposMascotas, models.DO_NOTHING, db_column='id_tipoMascota', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipos_razasmascotas'


class TiposSangremascotas(models.Model):
    abreviacion = models.CharField(max_length=10, blank=True, null=True)
    descripcion = models.CharField(max_length=50, blank=True, null=True)
    id_tipomascota = models.ForeignKey(TiposMascotas, models.DO_NOTHING, db_column='id_tipoMascota', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipos_sangremascotas'


class Usuarios(models.Model):
    info_usuario = models.OneToOneField(InfoUsuarios, on_delete=models.CASCADE, primary_key=True, related_name='usuario')
    id_tipodocumento = models.ForeignKey('TiposDocumentos', models.DO_NOTHING, db_column='id_tipoDocumento', blank=True, null=True)
    numero_documento = models.BigIntegerField(blank=True, null=True)
    nombres = models.CharField(max_length=60, blank=True, null=True)
    apellidos = models.CharField(max_length=60, blank=True, null=True)
    edad = models.IntegerField(blank=True, null=True)
    telefono = models.IntegerField(default=0, null=False, blank=False)
    id_tipogenero = models.ForeignKey('TiposGenero', models.DO_NOTHING, db_column='id_tipoGenero', blank=True, null=True)
    antecedentes = models.CharField(max_length=100, blank=True, null=True)
    direccion = models.CharField(max_length=60, blank=True, null=True)
    id_rol = models.ForeignKey('Roles', models.DO_NOTHING, db_column='id_rol', blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'usuarios'
