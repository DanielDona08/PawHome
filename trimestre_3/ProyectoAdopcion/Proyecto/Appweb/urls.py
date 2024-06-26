from django.urls import include, path
from . import views
from django.contrib.auth.views import LogoutView

urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('adopcion/<int:mascota_id>/', views.adopcion_view, name='adopcion'),
    path('adopcion/<int:mascota_id>/confirmada/', views.adopcion_confirmada_view, name='adopcion_confirmada'),
    path('publicacion/', views.publicar_mascota, name='publicacion'),
    path('busqueda_avanzada/', views.busqueda_avanzada, name='busqueda_avanzada'),
    path('obtener-razas-mascota/', views.obtener_razas_mascota, name='obtener_razas_mascota'),
    path('mascota/<int:pk>/', views.detalle_mascota, name='detalle_mascota'),
    path('mascota/<int:pk>/favorito/', views.detalle_mascota, name='agregar_favorito'),
    path('favoritos/', views.favoritos, name='favoritos'),
    path('eliminar_favorito/<int:favorito_id>/', views.eliminar_favorito, name='eliminar_favorito'),
    path('completar_datos/', views.completar_datos, name='completar_datos'),
    path('mi_cuenta/', views.mi_cuenta, name='mi_cuenta'),
    path('dueño/<int:usuario_id>/', views.detalle_dueño, name='detalle_dueño'),
    path('mascota/<int:pk>/editar/', views.editar_mascota, name='editar_mascota'),
    path('mascota/<int:pk>/borrar/', views.borrar_mascota, name='borrar_mascota'),
    path('notificaciones/', views.notificaciones_view, name='notificaciones'),
    path('detalle_solicitud_adopcion/<int:adopcion_id>/', views.detalle_solicitud_adopcion, name='detalle_solicitud_adopcion'),
    path('resultados_busqueda/', views.resultados_busqueda, name='resultados_busqueda'),
]
