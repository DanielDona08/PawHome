from django.db import models

# Create your models here.
class estudiante(models.Model): 
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50, verbose_name="Nombre")
    apellido = models.CharField(max_length=50, verbose_name="Apellido")
    foto = models.ImageField(upload_to='fotos/', verbose_name="Foto", null=True)
    clase = models.TextField(verbose_name="Clase", null=True)

    def __str__(self):
        return self.nombre + " " + self.apellido
    
    def delete(self, using=None, keep_parents=False):
        self.foto.storage.delete(self.foto.name)
        super().delete()