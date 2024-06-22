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
        
class CompletarDatosForm(forms.ModelForm):
    class Meta:
        model = Usuarios
        fields = ['id_tipodocumento', 'numero_documento', 'nombres', 'apellidos', 'edad', 'telefono', 'id_tipogenero', 'antecedentes', 'direccion']

