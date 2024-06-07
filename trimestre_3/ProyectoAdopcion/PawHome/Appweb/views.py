from django.http import HttpResponse
from django.shortcuts import render
from .forms import BusquedaAvanzadaForm
from .models import Mascotas, TiposRazasmascotas

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

    if request.method == 'POST':
        form = BusquedaAvanzadaForm(request.POST)
        if form.is_valid():
            tipo_mascota_id = form.cleaned_data.get('tipo_mascota')
            raza_mascota_id = form.cleaned_data.get('raza_mascota')
            genero_mascota = form.cleaned_data.get('genero_mascota')
            color_mascota_id = form.cleaned_data.get('color_mascota')
            tamano_mascota = form.cleaned_data.get('tamano_mascota')

            # Filtrar las razas según el tipo de mascota seleccionado
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




