import 'package:testot/app/modules/home/models/item_model.dart';

class ItemMock {
  static List<Item> getMockItems() {
    return [
      Item('Batata Frita', 15.0),
      Item('X-Burguer', 25.0),
      Item('Refrigerante', 5.0),
      Item('Pizza Margherita', 30.0),
      Item('Salada Caesar', 18.0),
    ];
  }
}
