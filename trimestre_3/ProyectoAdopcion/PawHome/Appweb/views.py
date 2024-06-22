from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from .forms import BusquedaAvanzadaForm, PublicacionMascotaForm
from .models import *
from django.contrib.auth.decorators import login_required
from django.contrib import messages


def PawHome(request):
    return HttpResponse('Bienvenidos a PawHome')


def inicio(request):
    mascotas = Mascotas.objects.all().order_by('-id')  
    context = {'mascotas': mascotas}
    return render(request, 'paginas/inicio.html', context)

def adopcion(request):
    return render(request, 'paginas/adopcion.html')

def favoritos(request):
    return render(request, 'paginas/favoritos.html')

@login_required
def publicacion(request):
    if request.method == 'POST':
        form = PublicacionMascotaForm(request.POST, request.FILES)
        print("POST data:", request.POST)
        print("FILES data:", request.FILES)
        if form.is_valid():
            print("Form is valid. Saving...")
            form.save()
            return redirect('inicio')
        else:
            print("Form errors:", form.errors)
    else:
        form = PublicacionMascotaForm()

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

def detalle_mascota(request, pk):
    mascota = get_object_or_404(Mascotas, pk=pk)
    
    if request.method == 'POST':
        if not request.user.is_authenticated:
            messages.info(request, 'Debes iniciar sesión para añadir a favoritos.')
            return redirect('login')  
        
        favorito, created = Favoritos.objects.get_or_create(usuario=request.user, mascota=mascota)
        if created:
            messages.success(request, f'{mascota.nombre_mascota} ha sido añadida a tus favoritos.')
        else:
            messages.info(request, f'{mascota.nombre_mascota} ya está en tus favoritos.')
        return redirect('favoritos')  
    
    context = {
        'mascota': mascota
    }
    return render(request, 'paginas/detalle_mascota.html', context)

@login_required
def favoritos(request):
    favoritos = Favoritos.objects.filter(usuario=request.user)
    context = {
        'mascotas_favoritas': favoritos
    }
    return render(request, 'paginas/favoritos.html', context)

def eliminar_favorito(request, favorito_id):
    favorito = get_object_or_404(Favoritos, id=favorito_id, usuario=request.user)
    favorito.delete()
    return redirect('favoritos')