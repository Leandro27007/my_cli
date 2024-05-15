import 'Restaurante.css.dart';

class Reservacion {
  String? hora;
  String? nombreAnfitrion;
  int cantidadPersonas;
  Restaurante? restaurante;

  Reservacion(
      this.hora, this.nombreAnfitrion, this.cantidadPersonas, this.restaurante);
}
