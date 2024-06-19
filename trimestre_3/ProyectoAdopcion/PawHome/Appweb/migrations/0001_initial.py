# Generated by Django 5.0.6 on 2024-06-19 18:43

import django.db.models.deletion
import django.utils.timezone
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='Mascotas',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('foto', models.ImageField(blank=True, null=True, upload_to='fotos_mascotas')),
                ('genero', models.CharField(blank=True, max_length=20, null=True)),
                ('condicion_saludmascota', models.CharField(blank=True, db_column='condicion_saludMascota', max_length=60, null=True)),
                ('nombre_mascota', models.CharField(blank=True, max_length=60, null=True)),
                ('comportamiento_mascota', models.CharField(blank=True, max_length=60, null=True)),
                ('historia_mascota', models.CharField(blank=True, max_length=60, null=True)),
                ('peso_mascota', models.CharField(blank=True, max_length=10, null=True)),
                ('altura_mascota', models.CharField(blank=True, max_length=20, null=True)),
                ('fecha_nacimientomascota', models.DateField(blank=True, db_column='fecha_nacimientoMascota', null=True)),
            ],
            options={
                'db_table': 'mascotas',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Roles',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=50)),
            ],
            options={
                'db_table': 'roles',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Sesiones',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('token', models.CharField(blank=True, max_length=255, null=True)),
                ('fecha_creacion', models.DateTimeField()),
                ('activa', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'sesiones',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TiposColormascotas',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('abreviacion', models.CharField(blank=True, max_length=10, null=True)),
                ('descripcion', models.CharField(blank=True, max_length=50, null=True)),
            ],
            options={
                'db_table': 'tipos_colormascotas',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TiposDocumentos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('abreviacion', models.CharField(blank=True, max_length=3, null=True)),
                ('descripcion', models.CharField(blank=True, max_length=50, null=True)),
            ],
            options={
                'db_table': 'tipos_documentos',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TiposGenero',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('abreviacion', models.CharField(blank=True, max_length=3, null=True)),
                ('descripcion', models.CharField(blank=True, max_length=50, null=True)),
            ],
            options={
                'db_table': 'tipos_genero',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TiposMascotas',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('abreviacion', models.CharField(blank=True, max_length=3, null=True)),
                ('descripcion', models.CharField(blank=True, max_length=50, null=True)),
            ],
            options={
                'db_table': 'tipos_mascotas',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TiposRazasmascotas',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('abreviacion', models.CharField(blank=True, max_length=10, null=True)),
                ('descripcion', models.CharField(blank=True, max_length=50, null=True)),
            ],
            options={
                'db_table': 'tipos_razasmascotas',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='TiposSangremascotas',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('abreviacion', models.CharField(blank=True, max_length=10, null=True)),
                ('descripcion', models.CharField(blank=True, max_length=50, null=True)),
            ],
            options={
                'db_table': 'tipos_sangremascotas',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='InfoUsuarios',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('email', models.EmailField(max_length=60, unique=True)),
                ('password', models.CharField(blank=True, max_length=128, null=True)),
                ('is_active', models.BooleanField(default=True)),
                ('is_staff', models.BooleanField(default=False)),
                ('date_joined', models.DateTimeField(default=django.utils.timezone.now)),
                ('groups', models.ManyToManyField(blank=True, related_name='info_usuarios_set', related_query_name='info_usuario', to='auth.group')),
                ('user_permissions', models.ManyToManyField(blank=True, related_name='info_usuarios_set', related_query_name='info_usuario', to='auth.permission')),
            ],
            options={
                'db_table': 'info_usuarios',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Favoritos',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha_agregado', models.DateTimeField(auto_now_add=True)),
                ('mascota', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Appweb.mascotas')),
                ('usuario', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='Usuarios',
            fields=[
                ('info_usuario', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, primary_key=True, related_name='usuario', serialize=False, to=settings.AUTH_USER_MODEL)),
                ('numero_documento', models.BigIntegerField(blank=True, null=True)),
                ('nombres', models.CharField(blank=True, max_length=60, null=True)),
                ('apellidos', models.CharField(blank=True, max_length=60, null=True)),
                ('edad', models.IntegerField(blank=True, null=True)),
                ('telefono', models.IntegerField(default=0)),
                ('antecedentes', models.CharField(blank=True, max_length=100, null=True)),
                ('direccion', models.CharField(blank=True, max_length=60, null=True)),
                ('id_rol', models.ForeignKey(blank=True, db_column='id_rol', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='Appweb.roles')),
                ('id_tipodocumento', models.ForeignKey(blank=True, db_column='id_tipoDocumento', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='Appweb.tiposdocumentos')),
                ('id_tipogenero', models.ForeignKey(blank=True, db_column='id_tipoGenero', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='Appweb.tiposgenero')),
            ],
            options={
                'db_table': 'usuarios',
                'managed': True,
            },
        ),
    ]
