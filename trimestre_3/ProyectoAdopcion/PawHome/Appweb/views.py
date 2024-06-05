from django.http import HttpResponse
from django.shortcuts import render
from .forms import BusquedaAvanzadaForm



  

def PawHome(request):
    return HttpResponse('Bienvenidos a PawHome')


def inicio(request):
    return render(request, 'paginas/inicio.html')


def adopcion(request):
    return render(request, 'paginas/adopcion.html')

def publicacion(request):
    return render(request, 'paginas/publicacion.html')

def busqueda_avanzada(request):
    form = BusquedaAvanzadaForm()
    return render(request, 'paginas/busqueda_avanzada.html', {'form': form})







   








