from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from .forms import BusquedaAvanzadaForm, PublicacionMascotaForm
from .models import *
from django.contrib.auth.decorators import login_required

def PawHome(request):
    return HttpResponse('Bienvenidos a PawHome')

def inicio(request):
    mascotas = Mascotas.objects.all()
    context = {'mascotas': mascotas}
    return render(request, 'paginas/inicio.html', context)

def adopcion(request):
    return render(request, 'paginas/adopcion.html')

def publicacion(request):
    form = PublicacionMascotaForm()

    if request.method == 'POST':
        form = PublicacionMascotaForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('inicio')

    tipos_mascotas = TiposMascotas.objects.all()
    tipos_razas = TiposRazasmascotas.objects.all()
    tipos_colores = TiposColormascotas.objects.all()
    tipos_sangre = TiposSangremascotas.objects.all()

    context = {
        'form': form,
        'tipos_mascotas': tipos_mascotas,
        'tipos_razas': tipos_razas,
        'tipos_colores': tipos_colores,
        'tipos_sangre': tipos_sangre,
    }

    return render(request, 'paginas/publicacion.html', context)

def busqueda_avanzada(request):
    form = BusquedaAvanzadaForm()

    if request.method == 'POST':
        form = BusquedaAvanzadaForm(request.POST)
        if form.is_valid():
            tipo_mascota_id = form.cleaned_data.get('tipo_mascota')
            raza_mascota_id = form.cleaned_data.get('raza_mascota')
            genero_mascota = form.cleaned_data.get('genero_mascota')
            color_mascota_id = form.cleaned_data.get('color_mascota')
            tamano_mascota = form.cleaned_data.get('tamano_mascota')

            if tipo_mascota_id:
                razas = TiposRazasmascotas.objects.filter(tipo_mascota=tipo_mascota_id)
                form.fields['raza_mascota'].queryset = razas
            else:
                form.fields['raza_mascota'].queryset = TiposRazasmascotas.objects.none()

            resultados_busqueda = Mascotas.objects.filter(
                tipo=tipo_mascota_id, 
                raza=raza_mascota_id, 
                genero=genero_mascota, 
                color=color_mascota_id, 
                tamano=tamano_mascota
            )
            return render(request, 'paginas/resultados_busqueda.html', {'resultados': resultados_busqueda})

    return render(request, 'paginas/busqueda_avanzada.html', {'form': form})

def obtener_razas_mascota(request):
    razas = TiposRazasmascotas.objects.all()
    razas_list = [{'id': raza.id, 'descripcion': raza.descripcion} for raza in razas]
    return JsonResponse({'razas': razas_list})