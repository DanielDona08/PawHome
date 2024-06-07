from django import forms
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
        usuario_info.password = self.cleaned_data['password']
        if commit:
            usuario_info.save()
        return usuario_info

        