from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin, Group, Permission, User
from django.db import models
from django.contrib.auth.hashers import check_password, make_password
from django.utils import timezone
from django.conf import settings


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


class Roles(models.Model):
    nombre = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'roles'


class TiposColormascotas(models.Model):
    abreviacion = models.CharField(max_length=10, blank=True, null=True)
    descripcion = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipos_colormascotas'

class TiposDocumentos(models.Model):
    abreviacion = models.CharField(max_length=3, blank=True, null=True)
    descripcion = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.descripcion

    class Meta:
        managed = False
        db_table = 'tipos_documentos'

class TiposGenero(models.Model):
    abreviacion = models.CharField(max_length=3, blank=True, null=True)
    descripcion = models.CharField(max_length=50, blank=True, null=True)

    def __str__(self):
        return self.descripcion

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
    id_tipomascota = models.ForeignKey(TiposMascotas, models.DO_NOTHING, db_column='id_tipomascota', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipos_razasmascotas'

class TiposSangremascotas(models.Model):
    abreviacion = models.CharField(max_length=10, blank=True, null=True)
    descripcion = models.CharField(max_length=50, blank=True, null=True)
    id_tipomascota = models.ForeignKey(TiposMascotas, models.DO_NOTHING, db_column='id_tipomascota', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipos_sangremascotas'

class Mascotas(models.Model):
    id_tipomascota = models.ForeignKey('TiposMascotas', models.DO_NOTHING, db_column='id_tipomascota', blank=True, null=True)
    id_tiporaza = models.ForeignKey('TiposRazasmascotas', models.DO_NOTHING, db_column='id_tiporaza', blank=True, null=True)
    foto = models.ImageField(upload_to='fotos_mascotas', blank=True, null=True)
    genero = models.CharField(max_length=20, blank=True, null=True)
    condicion_saludmascota = models.CharField(db_column='condicion_saludmascota', max_length=60, blank=True, null=True)
    nombre_mascota = models.CharField(max_length=60, blank=True, null=True)
    comportamiento_mascota = models.CharField(max_length=60, blank=True, null=True)
    historia_mascota = models.CharField(max_length=60, blank=True, null=True)
    peso_mascota = models.CharField(max_length=10, blank=True, null=True)
    id_colormascota = models.ForeignKey('TiposColormascotas', models.DO_NOTHING, db_column='id_colormascota', blank=True, null=True)
    altura_mascota = models.CharField(max_length=20, blank=True, null=True)
    fecha_nacimientomascota = models.DateField(db_column='fecha_nacimientomascota', blank=True, null=True)
    id_tiposangremascota = models.ForeignKey('TiposSangremascotas', models.DO_NOTHING, db_column='id_tiposangremascota', blank=True, null=True)
    

    def __str__(self):
        return self.nombre_mascota
    
    class Meta:
        managed = True
        db_table = 'mascotas'

class InfoUsuarios(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True, max_length=60)
    password = models.CharField(max_length=128, blank=True, null=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(default=timezone.now)
    mascotas = models.ManyToManyField(Mascotas, related_name='dueños')
    
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

class Usuarios(models.Model):
    id_tipodocumento = models.ForeignKey('TiposDocumentos', models.DO_NOTHING, db_column='id_tipodocumento', blank=True, null=True)
    numero_documento = models.BigIntegerField(blank=True, null=True)
    nombres = models.CharField(max_length=60, blank=True, null=True)
    apellidos = models.CharField(max_length=60, blank=True, null=True)
    edad = models.IntegerField(blank=True, null=True)
    telefono = models.IntegerField(default=0, null=False, blank=False)
    id_tipogenero = models.ForeignKey('TiposGenero', models.DO_NOTHING, db_column='id_tipogenero', blank=True, null=True)
    antecedentes = models.CharField(max_length=100, blank=True, null=True)
    direccion = models.CharField(max_length=60, blank=True, null=True)
    id_rol = models.ForeignKey('Roles', models.DO_NOTHING, db_column='id_rol', blank=True, null=True)
    info_usuario = models.OneToOneField(InfoUsuarios, on_delete=models.CASCADE, primary_key=True, related_name='usuario')
    
    
    def __str__(self):
        return self.nombres

    class Meta:
        managed = True
        db_table = 'usuarios'

    def falta_completar_datos(self):
        # Define los campos críticos que deben estar completos
        campos_criticos = ['nombres', 'apellidos', 'edad', 'telefono', 'direccion']
        for campo in campos_criticos:
            valor_campo = getattr(self, campo)
            if not valor_campo:
                return True
        return False
    



class Favoritos(models.Model):
    usuario = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    mascota = models.ForeignKey(Mascotas, on_delete=models.CASCADE)
    fecha_agregado = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Favorito de {self.usuario} - {self.mascota.nombre_mascota}"
    

class Sesiones(models.Model):
    id_usuario = models.ForeignKey(Usuarios, models.DO_NOTHING, db_column='id_usuario', blank=True, null=True)
    token = models.CharField(max_length=255, blank=True, null=True)
    fecha_creacion = models.DateTimeField()
    activa = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sesiones'


class Adopcion(models.Model):
    usuario = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    nombre = models.CharField(max_length=100)
    edad = models.IntegerField()
    tipoDocumento = models.CharField(max_length=3)
    numeroDocumento = models.CharField(max_length=20)
    genero = models.CharField(max_length=10)
    telefono = models.CharField(max_length=15)
    email = models.EmailField()
    antecedentes = models.TextField()
    motivo = models.TextField()

    def __str__(self):
        return f"Adopción de {self.nombre} por {self.usuario.username}"