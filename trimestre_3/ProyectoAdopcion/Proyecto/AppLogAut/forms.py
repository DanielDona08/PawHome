from django import forms
from django.contrib.auth.hashers import make_password 
from .models import InfoUsuarios

class RegistroForm(forms.ModelForm):
    nombres = forms.CharField(label='Nombres', max_length=60)
    apellidos = forms.CharField(label='Apellidos', max_length=60)
    telefono = forms.IntegerField(label='Teléfono')
    password = forms.CharField(label='Contraseña', widget=forms.PasswordInput)

    class Meta:
        model = InfoUsuarios
        fields = ['email', 'password']

    def save(self, commit=True):
        usuario_info = super().save(commit=False)
        usuario_info.password = make_password(self.cleaned_data['password'])  # Cifrar la contraseña
        if commit:
            usuario_info.save()
        return usuario_info




        