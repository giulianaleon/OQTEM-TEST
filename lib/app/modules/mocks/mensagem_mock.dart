import 'package:testot/app/modules/home/models/mensagem_model.dart';

class MensagemMock {
  static List<Mensagem> generateMessages() {
    return List.generate(1, (index) {
      return Mensagem(
        conteudo: 'Oi! Preciso de ajuda.',
        timestamp: DateTime.now().subtract(Duration(days: index)),
      );
    });
  }
}