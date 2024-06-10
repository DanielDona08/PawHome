from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from .forms import RegistroForm
from .models import *
from django.contrib.auth.hashers import check_password


def iniciar_sesion(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        
        try:
            usuario_info = InfoUsuarios.objects.get(email=email)
            
            if check_password(password, usuario_info.password):
                return render(request, 'exito.html', {'mensaje': 'Inicio de sesión exitoso'})
            else:
                error_message = "Contraseña incorrecta. Por favor, inténtalo de nuevo."
                return render(request, 'iniciar_sesion.html', {'error_message': error_message})
        except InfoUsuarios.DoesNotExist:
            error_message = "No se encontró ningún usuario con este correo electrónico."
            return render(request, 'iniciar_sesion.html', {'error_message': error_message})
    else:
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



