from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin, Group, Permission, User
from django.db import models
from django.contrib.auth.hashers import check_password, make_password
from django.utils import timezone
from django.conf import settings
from Core.models import Mascotas, Usuarios, TiposMascotas, TiposRazasmascotas, TiposColormascotas, TiposSangremascotas, Favoritos, TiposDocumentos, TiposGenero, InfoUsuarios, Adopcion