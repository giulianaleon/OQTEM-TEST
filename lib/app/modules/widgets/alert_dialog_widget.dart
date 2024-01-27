import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testot/app/modules/constants/app_color.dart';
import 'package:testot/app/modules/home/controllers/pedido_controller.dart';
import 'package:testot/app/modules/home/models/pedido_model.dart';

class AppDialogs {

  static Widget button(BuildContext context, String botao) {
    return ElevatedButton(
      onPressed: () => Navigator.pop(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fixedSize: const Size(400, 60),
      ),
      child: Text(
        botao,
        style: const TextStyle(
            fontSize: 15,
            color: AppColors.secondaryColor
        ),
      ),
    );
  }

  static Widget buttonWhite(BuildContext context, String botao) {
    return ElevatedButton(
      onPressed: () => Navigator.pop(context),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fixedSize: const Size(400, 60),
      ),
      child: Text(
        botao,
        style: const TextStyle(
            fontSize: 15,
            color: AppColors.primaryColor
        ),
      ),
    );
  }

  static void showErrorDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          AppDialogs.button(context, "OK"),
        ],
      ),
    );
  }

  static void showEmailDialog(BuildContext context, String title) {
    final TextEditingController emailController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: emailController,
          decoration: const InputDecoration(labelText: 'E-mail'),
        ),
        actions: [
          AppDialogs.buttonWhite(context, "Cancelar"),
          AppDialogs.button(context, "Enviar"),
        ],
      ),
    );
  }

  static void showPedidoStatusDialog(BuildContext context, String title, String content) {
    final PedidoController controllerPedido = Modular.get<PedidoController>();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text(
              'Cancelar',
              style: TextStyle(
                  fontSize: 15,
                  color: AppColors.primaryColor
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controllerPedido.setStatusPedidos();
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text(
              'Alterar',
              style: TextStyle(
                  fontSize: 15,
                  color: AppColors.secondaryColor
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void showPedidoDialog(BuildContext context, String title, String content, String botao, Pedido pedido) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text(
              'Cancelar',
              style: TextStyle(
                  fontSize: 15,
                  color: AppColors.primaryColor
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: Text(
              botao,
              style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.secondaryColor
              ),
            ),
          ),
        ],
      ),
    );
  }
}
