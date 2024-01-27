import 'package:testot/app/modules/home/models/cliente_model.dart';

class ClienteMock {
  static Cliente getMockClientes(String nome) {
    switch (nome) {
      case 'Lauren':
        return Cliente('Lauren', "General Osório, 11", 1);
      case 'Giuliana':
        return Cliente('Giuliana', "Presidente Vargas, 545", 1);
      default:
        return Cliente('', '', 0);
    }
  }
}