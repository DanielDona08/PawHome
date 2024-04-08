def mostrar_mascotas(mascotas):
    print("\nListado de Mascotas:\n")
    for mascota in mascotas:
        print("ID: ", mascota[0])
        print("Tipo de Mascota: ", mascota[1])
        print("Raza: ", mascota[2])
        print("Género: ", mascota[3])
        print("Condición de Salud: ", mascota[4])
        print("Nombre: ", mascota[5])
        print("Comportamiento: ", mascota[6])
        print("Historia: ", mascota[7])
        print("Peso: ", mascota[8])
        print("Tamaño: ", mascota[9])
        print("Color: ", mascota[10])
        print("Altura: ", mascota[11])
        print("Fecha de Nacimiento: ", mascota[12])
        print("Tipo de Sangre: ", mascota[13])
        print("\n")

def obtener_datos_mascota_registro():
    id_tipoMascota = int(input("Ingrese el número del tipo de mascota: "))
    id_tipoRaza = int(input("Ingrese el número del tipo de raza de su mascota: "))
    id_tipogeneroMascota = int(input("Ingrese el género de la mascota: "))
    condicion_saludMascota = input("Ingrese la condición de salud de la mascota: ")
    nombre_mascota = input("Ingrese el nombre de la mascota: ")
    comportamiento_mascota = input("Ingrese el comportamiento de la mascota: ")
    historia_mascota = input("Ingrese la historia de la mascota: ")
    peso_mascota = input("Ingrese el peso de la mascota: ")
    id_tamañoMascota = int(input("Ingrese el número del tamaño de la mascota: "))
    id_colorMascota = int(input("Ingrese número del color de la mascota: "))
    altura_mascota = input("Ingrese la altura de la mascota: ")
    fecha_nacimientoMascota = input("Ingrese la fecha de nacimiento de la mascota (YYYY-MM-DD): ")
    id_tiposangreMascota = int(input("Ingrese el número del tipo de sangre de la mascota: "))

    return (id_tipoMascota, id_tipoRaza, id_tipogeneroMascota, condicion_saludMascota, nombre_mascota, comportamiento_mascota, historia_mascota, peso_mascota, id_tamañoMascota, id_colorMascota, altura_mascota, fecha_nacimientoMascota, id_tiposangreMascota)

def obtener_datos_mascota_edicion():
    print("\nIngrese los nuevos datos de la mascota:")
    nueva_info = list(obtener_datos_mascota_registro())
    return nueva_info


def obtener_id_mascota_edicion():
    id_mascota = input("Ingrese el ID de la mascota que desea editar: ")
    return id_mascota

def obtener_id_mascota_eliminacion():
    return int(input("Ingrese el ID de la mascota que desea eliminar: "))
