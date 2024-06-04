from django import forms
from .models import Mascota

class BusquedaAvanzadaForm(forms.Form):
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

    tipo = forms.ChoiceField(choices=TIPO_MASCOTA_CHOICES, required=True)
    raza = forms.CharField(max_length=50, required=True)
    genero = forms.ChoiceField(choices=GENERO_CHOICES, required=True)
    color = forms.CharField(max_length=20, required=True)
    tamano = forms.ChoiceField(choices=TAMANO_CHOICES, required=True)
