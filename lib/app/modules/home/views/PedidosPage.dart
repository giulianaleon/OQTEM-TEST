import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:testot/app/modules/constants/app_color.dart';
import 'package:testot/app/modules/home/controllers/pedido_controller.dart';
import 'package:testot/app/modules/home/controllers/restaurante_controller.dart';
import 'package:testot/app/modules/home/models/pedido_model.dart';
import 'package:testot/app/modules/widgets/alert_dialog_widget.dart';
import 'package:testot/app/modules/widgets/botao_widget.dart';
import 'package:testot/app/modules/widgets/drawer_widget.dart';
import 'package:testot/app/modules/widgets/dropdown_widget.dart';

class PedidosPage extends StatefulWidget {
  @override
  _PedidosPageState createState() => _PedidosPageState();
}

class _PedidosPageState extends State<PedidosPage> with SingleTickerProviderStateMixin {

  final PedidoController controllerPedido = Modular.get<PedidoController>();
  final RestauranteController controllerRestaurante = Modular.get<RestauranteController>();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.width * .05,
        backgroundColor: AppColors.primaryColor,
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .05),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:() {
                    CustomDrawerPedidos().openDrawer(context);
                  },
                  child: Image.asset(
                    'assets/images/Thumb.png',
                    height: MediaQuery.of(context).size.height * .08,
                    fit: BoxFit.contain,
                  ),
                ).animate().fadeIn(duration: 500.ms).slideX(delay: 2.microseconds, begin: -2.0),
                Row(
                  children: [
                    Dropdowns.buildConfigDropdown(context, controllerRestaurante).animate().fadeIn(duration: 1000.ms).slideY(delay: 2.microseconds, begin: -2.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: AppColors.secondaryColor,
        child: desktopView(),
      ),
      floatingActionButton: CustomChatButton(
        onPressed: () async {
          CustomDrawerChat().openRightDrawer(context, controllerPedido);
        },
      ).animate().fadeIn(duration: 500.ms).slideX(delay: 2.microseconds, begin: 2.0),
    );
  }

  Widget desktopView() {
    final double tabHorizontalPadding = MediaQuery.of(context).size.width * .01;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * .08),
        child: SizedBox(
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            toolbarHeight: MediaQuery.of(context).size.height * 0.01,
            shadowColor: Colors.transparent,
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              indicatorColor: AppColors.primaryColor,
              labelColor: AppColors.primaryColor,
              tabs: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: tabHorizontalPadding),
                  child: const Tab(text: 'Todos'),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: tabHorizontalPadding),
                  child: const Tab(text: 'Recebidos'),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: tabHorizontalPadding),
                  child: const Tab(text: 'Em Preparo'),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: tabHorizontalPadding),
                  child: const Tab(text: 'Concluídos'),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: tabHorizontalPadding),
                  child: const Tab(text: 'Recusados'),
                ),
              ],
              labelStyle: const TextStyle(fontSize: 18, fontFamily: 'JosefinSans'),
              mouseCursor: SystemMouseCursors.click,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
        child: TabBarView(
          controller: _tabController,
          children: [
            buildTabContent().animate().fadeIn(duration: 1000.ms).slideX(delay: 05.microseconds, begin: -2.0),
            buildTabContent(status: StatusPedido.recebido).animate().fadeIn(duration: 1000.ms).slideX(delay: 05.microseconds, begin: -2.0),
            buildTabContent(status: StatusPedido.preparo).animate().fadeIn(duration: 1000.ms).slideX(delay: 05.microseconds, begin: -2.0),
            buildTabContent(status: StatusPedido.concluido).animate().fadeIn(duration: 1000.ms).slideX(delay: 05.microseconds, begin: -2.0),
            buildTabContent(status: StatusPedido.recusado).animate().fadeIn(duration: 1000.ms).slideX(delay: 05.microseconds, begin: -2.0),
          ],
        ),
      ),
    );
  }

  Widget buildTabContent({StatusPedido? status}) {
    return Observer(
      builder: (context) {
        final List<Pedido> pedidos = status != null
            ? controllerPedido.pedidos.where((pedido) => pedido.status == status).toList()
            : controllerPedido.pedidos.toList();
        if (pedidos.isEmpty) {
          return const Center(
            child: Text('Nenhum pedido disponível.'),
          );
        } else {
          return ListView.builder(
            itemCount: pedidos.length,
            itemBuilder: (context, index) {
              final cliente = pedidos[index].cliente;
              final itens = pedidos[index].items;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .03),
                child: Card(
                  color: AppColors.secondaryColor,
                  elevation: 1,
                  child: Padding(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.height * .02),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  cliente.nome,
                                  style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontSize: 20
                                  ),
                                ),
                                subtitle: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (var item in Set.of(itens))
                                      Text('${itens.where((i) => i == item).length}x ${item.nome}${item != itens.last ? ' + ' : ''}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Column(
                            children: [
                              ListTile(
                                subtitle: Container(
                                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.height * .04),
                                  child: CustomDetailsButton(
                                    onPressed: () async {
                                      CustomDrawer().openRightDrawer(context, pedidos[index]);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.green,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.height * .02, 0, 0, 0),
                                child: Text("Entregar até ${DateFormat('HH:mm').format(pedidos[index].entregaHora)}"),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          child: Center(
                            child: Column(
                              children: [
                                const Text("Status do pedido"),
                                Dropdowns.buildStatusDropdown(
                                  pedidos[index].status,
                                      (newStatus) {
                                        AppDialogs.showPedidoStatusDialog(context, "Status do Pedido", "Deseja alterar o status?");
                                    if (controllerPedido.statusPedido && newStatus != null) {
                                      controllerPedido.atualizarStatusPedido(pedidos[index], newStatus);
                                      controllerPedido.setStatusPedidos();
                                    }
                                  },
                                ),
                              ],
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
      },
    );
  }

}
