from django.urls import include, path
from . import views
from django.contrib.auth.views import LogoutView

urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('adopcion/', views.adopcion, name='adopcion'),
    path('publicacion/', views.publicacion, name='publicacion'),
    path('busqueda_avanzada/', views.busqueda_avanzada, name='busqueda_avanzada'),
    path('obtener-razas-mascota/', views.obtener_razas_mascota, name='obtener_razas_mascota'),
    path('mascota/<int:pk>/', views.detalle_mascota, name='detalle_mascota'),
    path('mascota/<int:pk>/favorito/', views.detalle_mascota, name='agregar_favorito'),
    path('favoritos/', views.favoritos, name='favoritos'),
    path('eliminar_favorito/<int:favorito_id>/', views.eliminar_favorito, name='eliminar_favorito'),
    
]
