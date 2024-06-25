from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from .forms import BusquedaAvanzadaForm, PublicacionMascotaForm, CompletarDatosForm, MascotaForm
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .models import Mascotas, Usuarios, TiposMascotas, TiposRazasmascotas, TiposColormascotas, TiposSangremascotas, Favoritos, InfoUsuarios, Adopcion, Notificacion
from django.core.mail import send_mail


def PawHome(request):
    return HttpResponse('Bienvenidos a PawHome')

def inicio(request):
    mascotas = Mascotas.objects.all()
    context = {
        'mascotas': mascotas
    }
    return render(request, 'paginas/inicio.html', context)


def favoritos(request):
    return render(request, 'paginas/favoritos.html')

def mi_cuenta(request):
    user = Usuarios.objects.get(info_usuario=request.user)
    context = {
        'user': user
    }
    return render(request, 'paginas/mi_cuenta.html', context)

@login_required
def publicar_mascota(request):
    if request.method == 'POST':
        form = PublicacionMascotaForm(request.POST, request.FILES, instance=Mascotas())
        if form.is_valid():
            mascota = form.save(commit=False)  
            print(f"Mascota antes de guardar: {mascota}")  
            current_user = request.user
            print(f"Usuario actual: {current_user}")  
            print(f"Mascotas del usuario: {current_user.mascotas.all()}")  
            mascota.save()  
            current_user.mascotas.add(mascota)  
            print(f"ID de la mascota: {mascota.id}")  
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
    dueños = mascota.dueños.all()

    es_dueño = request.user.is_authenticated and dueños.filter(pk=request.user.pk).exists()

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
        'mascota': mascota,
        'dueños': dueños,
        'es_dueño': es_dueño,
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


@login_required
def completar_datos(request):
    usuario_info = request.user
    try:
        usuario = Usuarios.objects.get(info_usuario=usuario_info)
    except Usuarios.DoesNotExist:
        usuario = None

    if request.method == 'POST':
        form = CompletarDatosForm(request.POST, instance=usuario)
        if form.is_valid():
            datos_usuario = form.save(commit=False)
            datos_usuario.info_usuario = usuario_info
            datos_usuario.save()
            return redirect('mi_cuenta')
    else:
        form = CompletarDatosForm(instance=usuario)

    contexto = {
        'form': form
    }
    return render(request, 'paginas/completar_datos.html', contexto)


def detalle_dueño(request, usuario_id):
    usuario = get_object_or_404(InfoUsuarios, id=usuario_id)
    return render(request, 'paginas/detalle_dueño.html', {'usuario': usuario})


@login_required
def editar_mascota(request, pk):
    mascota = get_object_or_404(Mascotas, pk=pk)

    if request.user not in mascota.dueños.all():
        messages.error(request, 'No tienes permiso para editar esta mascota.')
        return redirect('detalle_mascota', pk=pk)

    if request.method == 'POST':
        form = MascotaForm(request.POST, request.FILES, instance=mascota)
        if form.is_valid():
            form.save()
            messages.success(request, 'Mascota actualizada correctamente.')
            return redirect('detalle_mascota', pk=pk)
    else:
        form = MascotaForm(instance=mascota)

    return render(request, 'paginas/editar_mascota.html', {'form': form, 'mascota': mascota})

@login_required
def borrar_mascota(request, pk):
    mascota = get_object_or_404(Mascotas, pk=pk)

    if request.user not in mascota.dueños.all():
        messages.error(request, 'No tienes permiso para borrar esta mascota.')
        return redirect('detalle_mascota', pk=pk)

    if request.method == 'POST':
        mascota.delete()
        messages.success(request, 'Mascota borrada correctamente.')
        return redirect('inicio')

    return render(request, 'paginas/borrar_mascota.html', {'mascota': mascota})


@login_required
def adopcion_view(request, mascota_id):
    mascota = get_object_or_404(Mascotas, id=mascota_id)
    
    if request.method == 'POST':
        nombre = request.POST['nombre']
        edad = request.POST['edad']
        tipo_documento = request.POST['tipoDocumento']
        numero_documento = request.POST['numeroDocumento']
        genero = request.POST['genero']
        telefono = request.POST['telefono']
        email = request.POST['email']
        antecedentes = request.POST['antecedentes']
        motivo = request.POST['motivo']
        
        adopcion = Adopcion.objects.create(
            usuario=request.user,
            mascota=mascota,
            nombre=nombre,
            edad=edad,
            tipoDocumento=tipo_documento,
            numeroDocumento=numero_documento,
            genero=genero,
            telefono=telefono,
            email=email,
            antecedentes=antecedentes,
            motivo=motivo
        )
        
        # Crear una notificación para el dueño de la mascota
        dueño = mascota.dueños.first()
        mensaje = f'Tienes una nueva solicitud de adopción para tu mascota {mascota.nombre_mascota}.'
        Notificacion.objects.create(usuario=dueño, mensaje=mensaje, adopcion = adopcion)
        
        # Redirigir a la página de confirmación de adopción
        return redirect('adopcion_confirmada', mascota_id=mascota.id)

    return render(request, 'paginas/adopcion.html', {'mascota': mascota})


@login_required
def adopcion_confirmada_view(request, mascota_id):
    mascota = get_object_or_404(Mascotas, id=mascota_id)
    return render(request, 'paginas/adopcion_confirmada.html', {'mascota': mascota})




def notificaciones_view(request):
    notificaciones = Notificacion.objects.filter(usuario=request.user)
    context = {
        'notificaciones': notificaciones
    }
    return render(request, 'paginas/notificaciones.html', context)


@login_required
def detalle_solicitud_adopcion(request, adopcion_id):
    adopcion = get_object_or_404(Adopcion, pk=adopcion_id)
    context = {
        'adopcion': adopcion
    }
    return render(request, 'paginas/detalle_solicitud_adopcion.html', context)


