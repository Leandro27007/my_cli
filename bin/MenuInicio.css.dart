/*import 'dart:io';

class MenuInicio {
  List<String> opcionesInicio = [
    '1.  Nueva Reservacion  ())',
    '2.  Ver reservaciones  ()',
    '3.  Imprimir Reservacion  ()'
  ];

  mostrarOpciones(OpcionMenu tipoMenu) {
    print(r"""
                     ITLA - Complejo turistico!
  """);

    while (true) {
      print(Process.runSync("clear", [], runInShell: true).stdout);

      print(r"""
                ------------------------------
                   Ingrese una opcion
                ------------------------------
  """);

      print(tipoMenu.name);

      for (var item in opcionesInicio) {
        print('\n $item');
      }

      return stdin.readLineSync()!;
    }
  }
}

enum OpcionMenu { inicio, formularioReservacion, formularioBuscarReservacion }
*/