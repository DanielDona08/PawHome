from django.urls import path
from . import views

urlpatterns = [
  
  path('', views.inicio, name='inicio'),
  path('adopcion/', views.adopcion, name='adopcion'),
  path('publicacion/', views.publicacion, name='publicacion'),
  path('busqueda_avanzada/', views.busqueda_avanzada, name='busqueda_avanzada'),
  

]
	