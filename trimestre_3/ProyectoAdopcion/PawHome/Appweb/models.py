from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin, Group, Permission
from django.db import models
from django.contrib.auth.hashers import check_password, make_password
from django.utils import timezone

class CustomUserManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('El correo electrónico debe ser proporcionado')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('El superusuario debe tener is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('El superusuario debe tener is_superuser=True.')

        return self.create_user(email, password, **extra_fields)
    

class InfoUsuarios(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True, max_length=60)
    password = models.CharField(max_length=128, blank=True, null=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(default=timezone.now)
    
    groups = models.ManyToManyField(
        Group,
        related_name='info_usuarios_set',
        related_query_name='info_usuario',
        blank=True,
    )
    user_permissions = models.ManyToManyField(
        Permission,
        related_name='info_usuarios_set',
        related_query_name='info_usuario',
        blank=True,
    )

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = []

    objects = CustomUserManager()

    class Meta:
        managed = True
        db_table = 'info_usuarios'

    def __str__(self):
        return self.email

    def set_password(self, raw_password):
        self.password = make_password(raw_password)

    def check_password(self, raw_password):
        return check_password(raw_password, self.password)

    def has_perm(self, perm, obj=None):
        return self.is_superuser or self.is_staff

    def has_module_perms(self, app_label):
        return self.is_superuser or self.is_staff

class Mascotas(models.Model):
    id_tipomascota = models.ForeignKey('TiposMascotas', models.DO_NOTHING, db_column='id_tipoMascota', blank=True, null=True)
    id_tiporaza = models.ForeignKey('TiposRazasmascotas', models.DO_NOTHING, db_column='id_tipoRaza', blank=True, null=True)
    foto = models.ImageField(upload_to='fotos_mascotas', blank=True, null=True)
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
