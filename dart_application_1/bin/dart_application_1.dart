import 'dart:io';

// Clase Estudiante
class Estudiante {
  String nombre;
  List<double> calificaciones;

  Estudiante(this.nombre, this.calificaciones);

  // Función para calcular el promedio
  double calcularPromedio() {
    double suma = calificaciones.reduce((a, b) => a + b);
    return suma / calificaciones.length;
  }

  // Función para obtener la calificación más alta
  double calificacionMasAlta() {
    return calificaciones.reduce((a, b) => a > b ? a : b);
  }

  // Función para obtener la calificación más baja
  double calificacionMasBaja() {
    return calificaciones.reduce((a, b) => a < b ? a : b);
  }
}

// Lista global de estudiantes
List<Estudiante> estudiantes = [];

// Función para añadir un nuevo estudiante
void agregarEstudiante() {
  print('Ingresa el nombre del estudiante:');
  String nombre = stdin.readLineSync()!;

  print('¿Cuántas calificaciones deseas ingresar para $nombre?');
  int numCalificaciones = int.parse(stdin.readLineSync()!);

  List<double> calificaciones = [];
  for (int i = 0; i < numCalificaciones; i++) {
    print('Ingresa la calificación ${i + 1}:');
    double calificacion = double.parse(stdin.readLineSync()!);
    calificaciones.add(calificacion);
  }

  Estudiante nuevoEstudiante = Estudiante(nombre, calificaciones);
  estudiantes.add(nuevoEstudiante);

  print('Estudiante $nombre añadido correctamente con sus calificaciones.');
}

// Función para calcular el promedio y mostrar a los estudiantes
void calcularPromedioEstudiantes() {
  if (estudiantes.isEmpty) {
    print('No hay estudiantes registrados.');
  } else {
    for (var estudiante in estudiantes) {
      print('Estudiante: ${estudiante.nombre}');
      print('Promedio: ${estudiante.calcularPromedio()}');
    }
  }
}

// Función para mostrar la calificación más alta y más baja para cada estudiante
void mostrarCalificacionesAltasYBajas() {
  if (estudiantes.isEmpty) {
    print('No hay estudiantes registrados.');
  } else {
    for (var estudiante in estudiantes) {
      print('Estudiante: ${estudiante.nombre}');
      print('Calificación más alta: ${estudiante.calificacionMasAlta()}');
      print('Calificación más baja: ${estudiante.calificacionMasBaja()}');
      print('---------------------------');
    }
  }
}

// Función para mostrar estudiantes con promedio superior a un valor dado
void mostrarEstudiantesConPromedioSuperior() {
  print('Ingresa el valor mínimo de promedio:');
  double promedioMinimo = double.parse(stdin.readLineSync()!);

  for (var estudiante in estudiantes) {
    double promedio = estudiante.calcularPromedio();
    if (promedio > promedioMinimo) {
      print('Estudiante: ${estudiante.nombre} - Promedio: $promedio');
    }
  }
}

// Función para ordenar estudiantes por su promedio
void ordenarEstudiantes(bool ascendente) {
  estudiantes.sort((a, b) {
    if (ascendente) {
      return a.calcularPromedio().compareTo(b.calcularPromedio());
    } else {
      return b.calcularPromedio().compareTo(a.calcularPromedio());
    }
  });

  print('Estudiantes ordenados por promedio:');
  calcularPromedioEstudiantes();
}

void main() {
  while (true) {
    print('--- Gestión de Estudiantes ---');
    print('1. Añadir estudiante');
    print('2. Calcular y mostrar promedio de estudiantes');
    print('3. Mostrar calificación más alta y más baja');
    print('4. Mostrar estudiantes con promedio superior a un valor dado');
    print('5. Ordenar estudiantes por promedio');
    print('6. Salir');
    String? opcion = stdin.readLineSync();

    if (opcion == '1') {
      agregarEstudiante();
    } else if (opcion == '2') {
      calcularPromedioEstudiantes();
    } else if (opcion == '3') {
      mostrarCalificacionesAltasYBajas();
    } else if (opcion == '4') {
      mostrarEstudiantesConPromedioSuperior();
    } else if (opcion == '5') {
      print('¿Cómo deseas ordenar los estudiantes?');
      print('1. Ascendente');
      print('2. Descendente');
      String? orden = stdin.readLineSync();
      if (orden == '1') {
        ordenarEstudiantes(true); // Ascendente
      } else if (orden == '2') {
        ordenarEstudiantes(false); // Descendente
      } else {
        print('Opción no válida.');
      }
    } else if (opcion == '6') {
      print('Saliendo...');
      break;
    } else {
      print('Opción no válida, intenta de nuevo.');
    }
  }
}
