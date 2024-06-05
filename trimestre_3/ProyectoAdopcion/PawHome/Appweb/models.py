from django.db import models

class Raza(models.Model):
    TIPO_CHOICES = (
        ('perro', 'Perro'),
        ('gato', 'Gato'),
    )
    nombre = models.CharField(max_length=100)
    tipo = models.CharField(max_length=5, choices=TIPO_CHOICES)

    def __str__(self):
        return self.nombre