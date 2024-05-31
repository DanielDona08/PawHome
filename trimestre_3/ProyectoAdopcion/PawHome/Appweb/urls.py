from django.urls import path
from . import views

urlpatterns = [
  
  path('', views.inicio, name='inicio'),
  path('adopcion/', views.adopcion, name='adopcion'),
    
]
	