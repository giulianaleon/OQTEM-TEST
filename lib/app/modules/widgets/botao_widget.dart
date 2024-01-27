import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testot/app/modules/constants/app_color.dart';
import 'package:testot/app/modules/home/controllers/mensagem_controller.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String texto;

  const CustomButton({super.key, required this.onPressed, required this.texto});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fixedSize: const Size(800, 60),
      ),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 15,
          color: AppColors.secondaryColor,
        ),
      ),
    );
  }
}

class CustomButtonWhite extends StatelessWidget {
  final VoidCallback onPressed;
  final String texto;

  const CustomButtonWhite({super.key, required this.onPressed, required this.texto});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fixedSize: const Size(800, 60),
      ),
      child: Text(
        texto,
        style: const TextStyle(
            fontSize: 15,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

class CustomDetailsButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomDetailsButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: const Text(
          'Ver detalhes',
          style: TextStyle(
            fontSize: 15,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class CustomChatButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomChatButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final MensagemController messageStore = Modular.get<MensagemController>();
    return Stack(
      children: [
        FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          shape: const CircleBorder(),
          onPressed: onPressed,
          child: const Icon(Icons.message, color: Colors.white),
        ),
        Observer(
          builder: (context) {
            if (messageStore.hasUnreadMessages) {
              return Positioned(
                right: 0,
                top: 1,
                child: Container(
                  padding: const EdgeInsets.all(7),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            } else {
              return const SizedBox();
            }
          }
        ),
      ],
    );
  }
}


