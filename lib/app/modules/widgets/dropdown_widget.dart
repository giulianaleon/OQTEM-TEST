import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testot/app/modules/constants/app_color.dart';
import 'package:testot/app/modules/home/controllers/restaurante_controller.dart';
import 'package:testot/app/modules/home/models/pedido_model.dart';

class Dropdowns {
  static PopupMenuButton<String> buildConfigDropdown(BuildContext context, RestauranteController controllerRestaurante) {
    return PopupMenuButton<String>(
      color: AppColors.secondaryColor,
      elevation: 1,
      offset: Offset(0, MediaQuery.of(context).size.height * .05),
      child: Row(
        children: [
          Observer(
            builder: (context) {
              final restauranteAtual = controllerRestaurante.restaurante;
              return Text(
                restauranteAtual?.nome ?? '',
                style: const TextStyle(
                  color: AppColors.secondaryColor,
                  fontSize: 16,
                ),
              );
            },
          ),
          // SizedBox(width: MediaQuery.of(context).size.width * .01),
          // const CircleAvatar(
          //   backgroundColor: AppColors.secondaryColor,
          //   radius: 18,
          //   child: Icon(
          //     Icons.face,
          //     color: AppColors.primaryColor,
          //     size: 20,
          //   ),
          // ),
          const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.secondaryColor,
          ),
        ],
      ),
      itemBuilder: (context) => [
        const PopupMenuItem<String>(
          value: 'configuracoes',
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
          ),
        ),
        const PopupMenuItem<String>(
          value: 'sair',
          child: ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
          ),
        ),
      ],
      onSelected: (value) {
        if (value == 'configuracoes') {
        } else if (value == 'sair') {
          Modular.to.pushReplacementNamed('/');
        }
      },
    );
  }

  static DropdownButton2<StatusPedido> buildStatusDropdown(
      StatusPedido selectedStatus,
      void Function(StatusPedido?) onChanged,
      ) {
    return DropdownButton2<StatusPedido>(
      value: selectedStatus,
      onChanged: onChanged,
      underline: const SizedBox(),
      isExpanded: false,
      items: StatusPedido.values.map((status) {
        return DropdownMenuItem<StatusPedido>(
          value: status,
          child: Text(
            status == StatusPedido.preparo
                ? 'Em ${status.toString().split('.').last}'
                : status.toString().split('.').last.capitalize(),
          ),
        );
      }).toList(),
    );
  }

}

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

