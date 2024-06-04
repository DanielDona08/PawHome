from django.db import models

class Mascota(models.Model):
    TIPO_MASCOTA_CHOICES = [
        ('perro', 'Perro'),
        ('gato', 'Gato'),
    ]

    GENERO_CHOICES = [
        ('macho', 'Macho'),
        ('hembra', 'Hembra'),
    ]

    TAMANO_CHOICES = [
        ('pequeno', 'Pequeño'),
        ('mediano', 'Mediano'),
        ('grande', 'Grande'),
    ]

    tipo = models.CharField(max_length=10, choices=TIPO_MASCOTA_CHOICES)
    raza = models.CharField(max_length=50)
    genero = models.CharField(max_length=10, choices=GENERO_CHOICES)
    color = models.CharField(max_length=20)
    tamano = models.CharField(max_length=10, choices=TAMANO_CHOICES)

    def __str__(self):
        return f"{self.tipo} - {self.raza}"