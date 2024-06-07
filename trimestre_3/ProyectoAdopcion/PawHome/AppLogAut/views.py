from django.shortcuts import render, redirect
from django.http import HttpResponse
from .forms import RegistroForm
from .models import *

def iniciar_sesion(request):
    return render(request, 'iniciar_sesion.html')

def cerrar_sesion(request):
    return render(request, 'cerrar_sesion.html')

def registrarse(request):
    if request.method == 'POST':
        form = RegistroForm(request.POST)
        if form.is_valid():
            usuario_info = form.save()
            usuario = Usuarios(
                info_usuario=usuario_info,
                nombres=form.cleaned_data['nombres'],
                apellidos=form.cleaned_data['apellidos'],
                telefono=form.cleaned_data['telefono'],
            )
            usuario.save()
            return redirect('inicio')
    else:
        form = RegistroForm()
    return render(request, 'registrarse.html', {'form': form})



