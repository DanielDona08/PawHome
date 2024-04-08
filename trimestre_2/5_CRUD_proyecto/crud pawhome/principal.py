from BD.conexion import MascotaDAO
import funciones

def menu_principal():
    dao = MascotaDAO()

    while True:
        print("==================== MENÚ PRINCIPAL ====================")
        print("1. Listar mascotas")
        print("2. Registrar mascota")
        print("3. Editar mascota")
        print("4. Eliminar mascota")
        print("5. Salir")
        print("========================================================")
        opcion = input("Seleccione una opción: ")

        if opcion == '1':
            mascotas = dao.listar_mascotas()
            funciones.mostrar_mascotas(mascotas)
        elif opcion == '2':
            mascota = funciones.obtener_datos_mascota_registro()
            dao.registrar_mascota(mascota)
        elif opcion == '3':
            id_mascota = funciones.obtener_id_mascota_edicion()
            nueva_info = funciones.obtener_datos_mascota_edicion()
            dao.editar_mascota(id_mascota, nueva_info)
        elif opcion == '4':
            id_mascota = funciones.obtener_id_mascota_eliminacion()
            dao.eliminar_mascota(id_mascota)
        elif opcion == '5':
            print("¡Gracias por usar este sistema!")
            break
        else:
            print("Opción no válida. Por favor, seleccione una opción válida.")

if __name__ == "__main__":
    menu_principal()