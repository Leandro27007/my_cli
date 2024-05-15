import 'dart:io';

import 'Reservacion.css.dart';
import 'Restaurante.css.dart';

class Main {
  List<Restaurante> restaurantes = [];
  String? nombreAnfitrion;
  int? cantidadPersonas;

  Main() {
    restaurantes.addAll([
      Restaurante('Ember', 3),
      Restaurante('Zao', 4),
      Restaurante('Grappa', 2),
      Restaurante('Larimar', 3)
    ]);
  }

  start() {
    var mostrarMenuPrincipal = false;

    do {
      print(
          "--Menu Principal--\n[1] Realizar reservacion \n[2] Ver reservaciones \n[3] Imprimir reservacion por restaurante");
      String? input = stdin.readLineSync()!;
      print(input);
      switch (input) {
        case "1":
          menuReservaciones();
          break;

        case "2":
          print(verReservaciones());
          break;

        case "3":
          menuReservacionesPorRestaurantes();
          break;

        default:
          print('Elija una opcion');
          mostrarMenuPrincipal = true;
          break;
      }
    } while (mostrarMenuPrincipal);

    start();
  }

  void menuReservacionesPorRestaurantes() {
    print(
        "--------------------------------------------------------------------");
    print(
        "Seleccione que restaurante quiere ver reservaciones, por defecto se motraran las de Ember.");

    print(
        "--EElija una opcion-- \n[1] Ember  \n[2] Zao \n[3] Grappa \n[4] Larimar");

    var opcion = stdin.readLineSync();
    switch (opcion) {
      case "1":
        print(verReservacionesPorRestaurante('Ember'));
        break;

      case "2":
        print(verReservacionesPorRestaurante('Zao'));
        break;

      case "3":
        print(verReservacionesPorRestaurante('Grappa'));
        break;
      case "4":
        print(verReservacionesPorRestaurante('Larimar'));
        break;
      default:
        print(verReservacionesPorRestaurante('Ember'));
        break;
    }

    start();
  }

  void menuReservaciones() {
    bool menuReservaciones = false;
    Reservacion? reservacion;

    do {
      print(
          "--Elija un restaurante-- \n[1] Ember  \n[2] Zao \n[3] Grappa \n[4] Larimar \n[0] Volver al menu principal");
      var input = stdin.readLineSync();
      if (input != null) {
        switch (input) {
          case "1":
            print("Reservación en Ember");

            print("Nombre del anfitrion: ");
            nombreAnfitrion = stdin.readLineSync();
            print("Cantidad personas: ");
            cantidadPersonas = int.parse(stdin.readLineSync()!);

            reservacion = Reservacion('6-8', nombreAnfitrion, cantidadPersonas!,
                restaurantes.where((x) => x.nombre == 'Ember').first);
            menuReservaciones = false;
            break;

          case "2":
            print("Reservación en Zao");

            print("Nombre del anfitrion: ");
            nombreAnfitrion = stdin.readLineSync();
            print("Cantidad personas: ");
            cantidadPersonas = int.parse(stdin.readLineSync()!);

            reservacion = Reservacion('6-8', nombreAnfitrion, cantidadPersonas!,
                restaurantes.where((x) => x.nombre == 'Zao').first);
            menuReservaciones = false;
            break;

          case "3":
            print("Reservación en Grappa");

            print("Nombre del anfitrion: ");
            nombreAnfitrion = stdin.readLineSync();
            print("Cantidad personas: ");
            cantidadPersonas = int.parse(stdin.readLineSync()!);

            reservacion = Reservacion('6-8', nombreAnfitrion, cantidadPersonas!,
                restaurantes.where((x) => x.nombre == 'Grappa').first);
            menuReservaciones = false;
            break;

          case "4":
            print("Reservación en Larimar");

            print("Nombre del anfitrion: ");
            nombreAnfitrion = stdin.readLineSync();
            print("Cantidad personas: ");
            cantidadPersonas = int.parse(stdin.readLineSync()!);

            reservacion = Reservacion('6-8', nombreAnfitrion, cantidadPersonas!,
                restaurantes.where((x) => x.nombre == 'Larimar').first);
            menuReservaciones = false;
            break;
          default:
            print("Opción no válida");
            menuReservaciones = true;
            break;
        }
      } else {
        print('Elija una opcion');
      }
    } while (menuReservaciones);

    print(hacerReservacion(reservacion));
    print('----------------------------------------------');
    verReservaciones();
    start();
  }

  String hacerReservacion(Reservacion? reservacion) {
    Restaurante? restauranteAReservar = restaurantes
        .where((x) => x.nombre == reservacion?.restaurante?.nombre)
        .firstOrNull;

    if (restauranteAReservar == null) {
      return 'No se encontro el restaurante';
    }

    Reservacion? reservacionPrevia = restauranteAReservar.reservaciones
        .where((x) => x.hora == reservacion?.hora)
        .firstOrNull;

    if (reservacionPrevia != null) {
      bool cupoDisponible =
          (reservacionPrevia.cantidadPersonas >= reservacion!.cantidadPersonas)
              ? false
              : true;

      if (cupoDisponible) {
        return 'Cupo no disponible';
      }
    }

    restauranteAReservar.reservaciones.add(reservacion!);

    return 'Reservacion exitosa';
  }

  String verReservacionesPorRestaurante(String nombreRestaurante) {
    String reservaciones = """
-----------------------------------------------------------
   Reservaciones en  $nombreRestaurante
-----------------------------------------------------------
""";

    for (var item in restaurantes
        .where((x) => x.nombre == nombreRestaurante)
        .first
        .reservaciones) {
      reservaciones += """
*********************
Anfitrion: ${item.nombreAnfitrion}.
Hora: ${item.hora}
Personas: ${item.cantidadPersonas}
*********************
""";
    }

    return reservaciones;
  }

  String verReservaciones() {
    String reservaciones = """
-----------------------------------------------------------
   TODAS LAS RESERVACIONES
-----------------------------------------------------------
""";

    for (var item in restaurantes[0].reservaciones) {
      reservaciones += """
*********************
Restaurante: ${item.restaurante?.nombre}.
Anfitrion: ${item.nombreAnfitrion}.
Hora: ${item.hora}
Personas: ${item.cantidadPersonas}
*********************
""";
    }

    for (var item in restaurantes[1].reservaciones) {
      reservaciones += """
*********************
Restaurante: ${item.restaurante?.nombre}.
Anfitrion: ${item.nombreAnfitrion}.
Hora: ${item.hora}
Personas: ${item.cantidadPersonas}
*********************
""";
    }

    for (var item in restaurantes[2].reservaciones) {
      reservaciones += """
*********************
Restaurante: ${item.restaurante?.nombre}.
Anfitrion: ${item.nombreAnfitrion}.
Hora: ${item.hora}
Personas: ${item.cantidadPersonas}
*********************
""";
    }

    return reservaciones;
  }
}
