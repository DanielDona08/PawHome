from django import forms
from .models import Raza

class BusquedaAvanzadaForm(forms.Form):
    tipoMascota = forms.ChoiceField(choices=Raza.TIPO_CHOICES, required=True)
    razaMascota = forms.ModelChoiceField(queryset=Raza.objects.none(), required=True)
    generoMascota = forms.ChoiceField(choices=[('macho', 'Macho'), ('hembra', 'Hembra')], required=True)
    colorMascota = forms.ChoiceField(choices=[('blanco', 'Blanco'), ('negro', 'Negro'), ('marron', 'Marrón'), ('gris', 'Gris'), ('dorado', 'Dorado'), ('atigrado', 'Atigrado')], required=True)
    tamanoMascota = forms.ChoiceField(choices=[('pequeno', 'Pequeño'), ('mediano', 'Mediano'), ('grande', 'Grande')], required=True)

    def __init__(self, *args, **kwargs):
        tipoMascota = kwargs.pop('tipoMascota', None)
        super(BusquedaAvanzadaForm, self).__init__(*args, **kwargs)
        if tipoMascota:
            self.fields['razaMascota'].queryset = Raza.objects.filter(tipo=tipoMascota)

