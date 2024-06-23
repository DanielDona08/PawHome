from django.urls import path
from . import views

urlpatterns = [
    path('iniciar_sesion/', views.iniciar_sesion, name='iniciar_sesion'),
    path('registrarse/', views.registrarse, name='registrarse'),
    path('logout/', views.cerrar_sesion, name='logout'),
]
