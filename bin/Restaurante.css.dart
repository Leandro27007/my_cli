import 'Reservacion.css.dart';
import 'RestauranteBase.css.dart';

class Restaurante extends RestauranteBase {
  String? nombre;
  int? capacidadPorHrs;
  List<Reservacion> reservaciones = [];

  Restaurante(this.nombre, this.capacidadPorHrs);
}
