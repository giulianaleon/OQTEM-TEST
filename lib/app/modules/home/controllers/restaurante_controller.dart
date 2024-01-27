import 'package:mobx/mobx.dart';
import 'package:testot/app/modules/home/models/restaurante_model.dart';

part 'restaurante_controller.g.dart';

class RestauranteController = _RestauranteControllerBase with _$RestauranteController;

abstract class _RestauranteControllerBase with Store {
  @observable
  Restaurante? restaurante;

  @action
  void setRestaurante(Restaurante novoRestaurante) {
    restaurante = novoRestaurante;
  }
}
