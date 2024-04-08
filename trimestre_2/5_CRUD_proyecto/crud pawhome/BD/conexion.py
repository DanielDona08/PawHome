import mysql.connector
from mysql.connector import Error

class MascotaDAO:

    def __init__(self):
        try:
            self.conexion = mysql.connector.connect(
                host='localhost',
                port=3306,
                user='root',
                password='',
                database='PawHome'
            )
        except Error as ex:
            print("Error al intentar la conexión: {0}".format(ex))

    def registrar_mascota(self, mascota):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sql = "INSERT INTO pets (id_tipoMascota, id_tipoRaza, id_tipogeneroMascota, condicion_saludMascota, nombre_mascota, comportamiento_mascota, historia_mascota, peso_mascota, id_tamañoMascota, id_colorMascota, altura_mascota, fecha_nacimientoMascota, id_tiposangreMascota) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                cursor.execute(sql, mascota)
                self.conexion.commit()
                print("¡Mascota registrada!\n")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))

    def listar_mascotas(self):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                cursor.execute("SELECT * FROM pets")
                mascotas = cursor.fetchall()
                return mascotas
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))

    def editar_mascota(self, id_mascota, nueva_info):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sql = "UPDATE pets SET id_tipoMascota=%s, id_tipoRaza=%s, id_tipogeneroMascota=%s, condicion_saludMascota=%s, nombre_mascota=%s, comportamiento_mascota=%s, historia_mascota=%s, peso_mascota=%s, id_tamañoMascota=%s, id_colorMascota=%s, altura_mascota=%s, fecha_nacimientoMascota=%s, id_tiposangreMascota=%s WHERE id=%s"
                nueva_info.append(id_mascota)
                cursor.execute(sql, nueva_info)
                self.conexion.commit()
                print("¡Mascota actualizada!\n")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))

    def eliminar_mascota(self, id_mascota):
        if self.conexion.is_connected():
            try:
                cursor = self.conexion.cursor()
                sql = "DELETE FROM pets WHERE id=%s"
                cursor.execute(sql, (id_mascota,))
                self.conexion.commit()
                print("¡Mascota eliminada!\n")
            except Error as ex:
                print("Error al intentar la conexión: {0}".format(ex))
