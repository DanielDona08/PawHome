from django import forms
from .models import TiposDocumentos, TiposGenero, TiposMascotas, TiposRazasmascotas, TiposColormascotas, Mascotas, Usuarios, TiposSangremascotas

class BusquedaAvanzadaForm(forms.Form):
    tipo_mascota = forms.ModelChoiceField(queryset=TiposMascotas.objects.all(), empty_label=None)
    raza_mascota = forms.ModelChoiceField(queryset=TiposRazasmascotas.objects.all(), empty_label=None)
    genero_mascota = forms.ChoiceField(choices=[('macho', 'Macho'), ('hembra', 'Hembra')])
    color_mascota = forms.ModelChoiceField(queryset=TiposColormascotas.objects.all(), empty_label=None)
    tamano_mascota = forms.ChoiceField(choices=[('pequeno', 'Pequeño'), ('mediano', 'Mediano'), ('grande', 'Grande')])

class PublicacionMascotaForm(forms.ModelForm):
    class Meta:
        model = Mascotas
        fields = [
            'id_tipomascota',
            'id_tiporaza',
            'foto',
            'genero',
            'condicion_saludmascota',
            'nombre_mascota',
            'comportamiento_mascota',
            'historia_mascota',
            'peso_mascota',
            'id_colormascota',
            'altura_mascota',
            'fecha_nacimientomascota',
            'id_tiposangremascota',
        ]

class MascotaForm(forms.ModelForm):
    id_tipomascota = forms.ModelChoiceField(queryset=TiposMascotas.objects.all(), empty_label=None, label="Tipo de mascota")
    id_tiporaza = forms.ModelChoiceField(queryset=TiposRazasmascotas.objects.all(), empty_label=None, label="Raza de la mascota")
    id_colormascota = forms.ModelChoiceField(queryset=TiposColormascotas.objects.all(), empty_label=None, label="Color de la mascota")
    id_tiposangremascota = forms.ModelChoiceField(queryset=TiposSangremascotas.objects.all(), empty_label=None, label="Tipo de sangre de la mascota")
    
    class Meta:
        model = Mascotas
        fields = [
            'nombre_mascota', 'id_tipomascota', 'id_tiporaza', 'genero', 'peso_mascota', 'id_colormascota',
            'altura_mascota', 'fecha_nacimientomascota', 'id_tiposangremascota', 'condicion_saludmascota',
            'comportamiento_mascota', 'historia_mascota', 'foto'
        ]

class CompletarDatosForm(forms.ModelForm):
    id_tipodocumento = forms.ModelChoiceField(queryset=TiposDocumentos.objects.all(), label='Tipo de documento')
    id_tipogenero = forms.ModelChoiceField(queryset=TiposGenero.objects.all(), label='Género')

    class Meta:
        model = Usuarios
        fields = ['id_tipodocumento', 'numero_documento', 'edad', 'id_tipogenero', 'antecedentes', 'direccion']


