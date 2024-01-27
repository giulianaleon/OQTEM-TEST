import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:testot/app/modules/constants/app_color.dart';
import 'package:testot/app/modules/home/controllers/mensagem_controller.dart';
import 'package:testot/app/modules/home/controllers/pedido_controller.dart';
import 'package:testot/app/modules/home/models/cliente_model.dart';
import 'package:testot/app/modules/home/models/pedido_model.dart';
import 'package:testot/app/modules/mocks/pedido_mock.dart';
import 'package:testot/app/modules/widgets/alert_dialog_widget.dart';
import 'package:testot/app/modules/widgets/botao_widget.dart';
import 'package:testot/app/modules/widgets/dropdown_widget.dart';

class CustomDrawer {
  void openRightDrawer(BuildContext context, Pedido pedido) {
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    final valorFormatado = formatter.format(pedido.valor);
    final pedidoID = "#${pedido.id.toString().padLeft(3, '0')}";
    final horario = DateFormat('HH:mm').format(pedido.entregaHora);
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        const double slideWidthFraction = 0.5;
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(slideWidthFraction, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              color: AppColors.secondaryColor,
              width: MediaQuery.of(context).size.width * slideWidthFraction,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close)
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * .01),
                      const Text(
                        'Detalhes do Pedido',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.none
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(flex: 1, child: itensRow(context, "Pedido", pedidoID)),
                      Flexible(flex: 1, child: itensRow(context, "Valor do pedido", valorFormatado)),
                      Flexible(flex: 1,child: itensRow(context, "Entregar até", horario)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .03),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .03),
                  Row(
                    children: [
                      Flexible(flex: 1, child: itensRow(context, "Cliente", pedido.cliente.nome)),
                      Flexible(flex: 1, child: itensRow(context, "Pedidos na loja", pedido.cliente.quantidadePedidos.toString())),
                      Flexible(flex: 1, child: itemDrop(context, "Status do pedido", pedido)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .03),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .03),
                  Row(
                    children: [
                      Flexible(flex: 1, child: itensRow(context, "Endereço", "Rua: ${pedido.cliente.endereco}")),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .03),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .03),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Itens do pedido",
                              style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontSize: 16,
                                color: Colors.black54,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            ...Set.of(pedido.items).map((item) {
                              final itemCount = pedido.items.where((i) => i == item).length;
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height * .02,0,0),
                                child: Text(
                                  '${itemCount}x ${item.nome}',
                                  style: const TextStyle(
                                    fontFamily: 'JosefinSans',
                                    fontSize: 16,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * slideWidthFraction,
                      height: MediaQuery.of(context).size.height,
                      child: Align(
                        alignment:Alignment.bottomCenter,
                        child: CustomButton(
                          onPressed: () async {
                          }, texto: 'Imprimir NF',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget itemDrop(BuildContext context, String texto, Pedido pedido) {
    final PedidoController controllerPedido = Modular.get<PedidoController>();
    return Observer(
        builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        texto,
                        style: const TextStyle(
                          fontFamily: 'JosefinSans',
                          fontSize: 16,
                          color: Colors.black54,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Material(
                        child: Dropdowns.buildStatusDropdown(
                          pedido.status,
                              (newStatus) {
                            AppDialogs.showPedidoStatusDialog(context, "Status do Pedido", "Deseja alterar o status?");
                            if (controllerPedido.statusPedido && newStatus != null) {
                              controllerPedido.atualizarStatusPedido(pedido, newStatus);
                              controllerPedido.setStatusPedidos();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        }
    );
  }
}

class CustomDrawerChat {
  final MensagemController messageStore = Modular.get<MensagemController>();

  void openRightDrawer(BuildContext context, PedidoController controllerPedido) {
    final List<Pedido> pedidos = controllerPedido.pedidos
        .where((pedido) => pedido.mensagens.isNotEmpty)
        .toList();
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        const double slideWidthFraction = 0.5;
        return Observer(
            builder: (context) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(slideWidthFraction, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    color: AppColors.secondaryColor,
                    width: MediaQuery.of(context).size.width * slideWidthFraction,
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: const Icon(Icons.close),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * .01),
                            const Text(
                              'Conversas',
                              style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontSize: 18,
                                color: Colors.black,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ],
                        ),
                        divider(context),
                        Expanded(
                          child: Row(
                            children: [
                              Flexible(
                                flex: 3,
                                child: ListView.builder(
                                  itemCount: pedidos.length,
                                  itemBuilder: (context, index) {
                                    final cliente = pedidos[index].cliente;
                                    return colunaPessoas(context, pedidos[index], cliente);
                                  },
                                ),
                              ),
                              const Flexible(
                                child: VerticalDivider(
                                  thickness: 1,
                                ),
                              ),
                              messageStore.selectedClient
                                  ? Flexible(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Flexible(
                                            child: Align(
                                              alignment: Alignment.topCenter,
                                              child: ListView.builder(
                                                  itemCount: messageStore.listMessages.length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, index){
                                                    return Card(
                                                      color: AppColors.secondaryColor,
                                                      elevation: 1,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets.all(MediaQuery.of(context).size.width * .005),
                                                            child: ListTile(
                                                              title: Text(
                                                                messageStore.selectedPedido!.cliente.nome,
                                                                style: const TextStyle(fontSize: 15, color: AppColors.primaryColor),
                                                              ),
                                                              subtitle: Text(
                                                                messageStore.listMessages[index].conteudo,
                                                                style: const TextStyle(fontSize: 15),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ).animate().fadeIn(duration: 800.ms).slideX(delay: 1.microseconds, begin: 2.0);
                                                  }
                                              )
                                            )
                                        ),
                                        Flexible(
                                            child: Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Material(
                                                child: TextField(
                                                  cursorColor: Colors.black54,
                                                  maxLines: 2,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: AppColors.secondaryColor,
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(10.0),
                                                    ),
                                                    suffixIcon: IconButton(
                                                      icon: const Icon(Icons.send, color: AppColors.primaryColor),
                                                      onPressed: () {
                                                      },
                                                    ),
                                                    hintText: 'Digite sua mensagem',
                                                    focusedBorder: const OutlineInputBorder(
                                                      borderSide: BorderSide(color: Colors.black54),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  )
                                  : const SizedBox()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        );
      },
    );
  }

  Widget divider(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * .02),
        const Divider(
          thickness: 1,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .02),
      ],
    );
  }

  Widget colunaPessoas(BuildContext context, Pedido pedido, Cliente cliente) {
    final MensagemController messageStore = Modular.get<MensagemController>();
    return GestureDetector(
      onTap: () {
        messageStore.setSelectedPedido(pedido);
      },
      child: Card(
        color: AppColors.secondaryColor,
        elevation: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * .005),
              child: ListTile(
                title: Text(
                  cliente.nome,
                  style: const TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  "Pedido #${pedido.id.toString().padLeft(3, '0')}",
                  style: const TextStyle(fontSize: 15),
                ),
                trailing: pedido.mensagens.isNotEmpty && messageStore.hasUnreadMessages
                    ? const Icon(
                  Icons.circle,
                  color: Colors.green,
                  size: 10,
                )
                    :const SizedBox()
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDrawerPedidos {
  void openDrawer(BuildContext context) {
    Pedido pedido = PedidoMock.getMockPedido();
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    final valorFormatado = formatter.format(pedido.valor);
    final pedidoID = "#${pedido.id.toString().padLeft(3, '0')}";
    final horario = DateFormat('HH:mm').format(pedido.entregaHora);
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) {
        return Align(
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              color: AppColors.secondaryColor,
              width: MediaQuery.of(context).size.width * .4,
              height: MediaQuery.of(context).size.height * .6,
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.close)
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * .01),
                      const Text(
                        'Novo Pedido',
                        style: TextStyle(
                            fontFamily: 'JosefinSans',
                            fontSize: 18,
                            color: Colors.black,
                            decoration: TextDecoration.none
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .06),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(flex: 1, child: itensRow(context, "Pedido", pedidoID)),
                      Flexible(flex: 2, child: itensRow(context, "Valor do pedido", valorFormatado)),
                      Flexible(flex: 1,child: itensRow(context, "Entregar até", horario)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .03),
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .03),
                  Row(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Itens do pedido",
                              style: TextStyle(
                                fontFamily: 'JosefinSans',
                                fontSize: 16,
                                color: Colors.black54,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            ...Set.of(pedido.items).map((item) {
                              final itemCount = pedido.items.where((i) => i == item).length;
                              return Padding(
                                padding: EdgeInsets.fromLTRB(0,MediaQuery.of(context).size.height * .02,0,0),
                                child: Text(
                                  '${itemCount}x ${item.nome}',
                                  style: const TextStyle(
                                    fontFamily: 'JosefinSans',
                                    fontSize: 16,
                                    color: Colors.black,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * .04),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .2,
                      child: CustomButton(
                        onPressed: ()  {
                          AppDialogs.showPedidoDialog(context, "Pedido", "Aceitar pedido?", "Aceitar", pedido);
                        },
                        texto: 'Aceitar',
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .2,
                      child: Align(
                        alignment:Alignment.bottomCenter,
                        child: CustomButtonWhite(
                          onPressed: ()  {
                            AppDialogs.showPedidoDialog(context, "Pedido", "Recusar pedido?", "Recusar", pedido);
                          },
                          texto: 'Recusar',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget itensRow(BuildContext context, String texto, String tipo) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              texto,
              style: const TextStyle(
                fontFamily: 'JosefinSans',
                fontSize: 16,
                color: Colors.black54,
                decoration: TextDecoration.none,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
              child: Text(
                tipo,
                style: const TextStyle(
                  fontFamily: 'JosefinSans',
                  fontSize: 16,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}





