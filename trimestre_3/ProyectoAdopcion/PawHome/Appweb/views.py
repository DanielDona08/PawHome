from django.http import HttpResponse
from django.shortcuts import render, redirect
from .forms import BusquedaAvanzadaForm
from .models import *

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


def publicar_mascota(request):
    # Obtener todos los tipos de datos necesarios para los selectores
    tipos_mascotas = TiposMascotas.objects.all()
    tipos_razas = TiposRazasmascotas.objects.all()
    tipos_colores = TiposColormascotas.objects.all()
    tipos_sangre = TiposSangremascotas.objects.all()
    
    if request.method == 'POST':
        # Obtener datos del formulario
        nombre = request.POST['nombre']
        telefono = request.POST['telefono']
        email = request.POST['email']
        nombre_mascota = request.POST['nombreMascota']
        tipo_mascota = TiposMascotas.objects.get(id=request.POST['tipoMascota'])
        raza_mascota = TiposRazasmascotas.objects.get(id=request.POST['razaMascota'])
        genero = request.POST['genero']
        edad = request.POST['edadMascota']
        color_mascota = TiposColormascotas.objects.get(id=request.POST['colorMascota'])
        fecha_nacimiento = request.POST['fechaNacimiento']
        peso = request.POST['pesoMascota']
        altura = request.POST['alturaMascota']
        tipo_sangre = TiposSangremascotas.objects.get(id=request.POST['tipoSangreMascota'])
        condicion_salud = request.POST['condicionSalud']
        comportamiento = request.POST['comportamiento']
        historia = request.POST['historia']
        foto = request.FILES['fotoMascota']
        
        # Crear y guardar la nueva mascota
        nueva_mascota = Mascotas(
            id_tipomascota=tipo_mascota,
            id_tiporaza=raza_mascota,
            foto=foto.name,
            genero=genero,
            condicion_saludmascota=condicion_salud,
            nombre_mascota=nombre_mascota,
            comportamiento_mascota=comportamiento,
            historia_mascota=historia,
            peso_mascota=peso,
            id_colormascota=color_mascota,
            altura_mascota=altura,
            fecha_nacimientomascota=fecha_nacimiento,
            id_tiposangremascota=tipo_sangre,
            id_dueño=request.user  # Suponiendo que el usuario está autenticado y es el dueño
        )
        nueva_mascota.save()
        
        # Redirigir a otra página después de guardar la mascota
        return redirect('index')

    # Pasar los tipos de datos necesarios al contexto de la plantilla
    context = {
        'tipos_mascotas': tipos_mascotas,
        'tipos_razas': tipos_razas,
        'tipos_colores': tipos_colores,
        'tipos_sangre': tipos_sangre
    }
    return render(request, 'publicacion.html', context)
