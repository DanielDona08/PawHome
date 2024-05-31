from django.shortcuts import render
from django.http import HttpResponse

# Create your views here.

def PawHome(request):
    return HttpResponse('Bienvenidos a PawHome')


def inicio(request):
    return render(request, 'paginas/inicio.html')


def adopcion(request):
    return render(request, 'paginas/adopcion.html')


