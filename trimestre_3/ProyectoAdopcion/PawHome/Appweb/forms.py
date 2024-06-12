from django import forms
from .models import *

class BusquedaAvanzadaForm(forms.Form):
    tipo_mascota = forms.ModelChoiceField(queryset=TiposMascotas.objects.all(), empty_label=None)
    raza_mascota = forms.ModelChoiceField(queryset=TiposRazasmascotas.objects.all(), empty_label=None)
    genero_mascota = forms.ChoiceField(choices=[('macho', 'Macho'), ('hembra', 'Hembra')])
    color_mascota = forms.ModelChoiceField(queryset=TiposColormascotas.objects.all(), empty_label=None)
    tamano_mascota = forms.ChoiceField(choices=[('pequeno', 'Pequeño'), ('mediano', 'Mediano'), ('grande', 'Grande')])

class PublicacionMascotaForm(forms.ModelForm):
    class Meta:
        model = Mascotas
        fields = '__all__'
