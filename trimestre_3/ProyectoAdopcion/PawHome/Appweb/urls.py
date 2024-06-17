from django.urls import include, path
from . import views

urlpatterns = [
    path('', views.inicio, name='inicio'),
    path('adopcion/', views.adopcion, name='adopcion'),
    path('publicacion/', views.publicacion, name='publicacion'),
    path('busqueda_avanzada/', views.busqueda_avanzada, name='busqueda_avanzada'),
    path('obtener-razas-mascota/', views.obtener_razas_mascota, name='obtener_razas_mascota'),
    path('mascota/<int:pk>/', views.detalle_mascota, name='detalle_mascota'),
]
