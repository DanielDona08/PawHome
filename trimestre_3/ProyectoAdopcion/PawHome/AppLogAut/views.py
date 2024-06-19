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
            print("Usuario encontrado:", usuario_info.email)
            if usuario_info.check_password(password):
                print("Contraseña válida")
                user = authenticate(request, email=email, password=password)
                print("Resultado de authenticate:", user)
                if user is not None:
                    login(request, user)
                    messages.success(request, '¡Inicio de sesión exitoso!')
                    return redirect('inicio')
                else:
                    messages.error(request, 'Hubo un problema al iniciar sesión. Por favor, inténtalo de nuevo.')
            else:
                print("Contraseña incorrecta")
                messages.error(request, 'El correo electrónico o la contraseña son incorrectos.')
        except InfoUsuarios.DoesNotExist:
            messages.error(request, 'El correo electrónico o la contraseña son incorrectos.')

    return render(request, 'iniciar_sesion.html')



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



def cerrar_sesion(request):
    logout(request)
    messages.success(request, '¡Sesión cerrada correctamente!')
    return redirect('inicio')