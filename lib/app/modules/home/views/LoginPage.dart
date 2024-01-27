import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:testot/app/modules/constants/app_color.dart';
import 'package:testot/app/modules/home/controllers/auth_controller.dart';
import 'package:testot/app/modules/home/controllers/senha_controller.dart';
import 'package:testot/app/modules/widgets/alert_dialog_widget.dart';
import 'package:testot/app/modules/widgets/botao_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthController controller = Modular.get<AuthController>();
  final SenhaController controllerSenha = Modular.get<SenhaController>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.secondaryColor,
        child: desktopView(),
      ),
    );
  }

  Widget desktopView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    letterSpacing: 3,
                    color: AppColors.primaryColor,
                    fontSize: MediaQuery.of(context).size.height * .05,
                    fontFamily: "JosefinSans"
                  ),
                  children: [
                    const TextSpan(
                      text: "A única plataforma de \ndelivery do Brasil que desvolve \n",
                    ),
                    TextSpan(
                      text: "cashback em sua conta",
                      style: TextStyle(
                        color: AppColors.yellow,
                        fontSize: MediaQuery.of(context).size.height * .05,
                        fontFamily: "JosefinSans"
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 800.ms).slideX(delay: 1.microseconds, begin: -2.0),
              SizedBox(height: MediaQuery.of(context).size.height * .15),
              Image.asset(
                'assets/images/herobanner.png',
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height * .5,
                width: MediaQuery.of(context).size.width * .5,
              ).animate().fadeIn(duration: 500.ms).slideY(delay: 1.microseconds, begin: 2.0),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: AppColors.primaryColor,
            child: Column(
              children: [
                imageLogo(),
                formLogin(),
              ],
            ),
          )
        ),
      ],
    );
  }

  Widget imageLogo(){
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
      child: Image.asset(
        'assets/images/Thumb.png',
        fit: BoxFit.none,
      ),
    ).animate().fadeIn(duration: 1000.ms).slideX(delay: 1.microseconds, begin: 2.0);
  }

  Widget formLogin() {
    return Container(
      color: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
            child: Card(
              color: AppColors.secondaryColor,
              elevation: 1,
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * .02),
                child: Column(
                  children: [
                    TextField(
                      cursorColor: Colors.black54,
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Colors.black54,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * .01),
                    Observer(
                        builder: (context){
                          return TextField(
                            cursorColor: Colors.black54,
                            controller: senhaController,
                            decoration: InputDecoration(
                              labelText: 'Senha',
                              labelStyle: const TextStyle(
                                color: Colors.black54,
                              ),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: (){
                                  controllerSenha.togglePasswordVisibility();
                                },
                                child: Icon(
                                  controllerSenha.obscureText ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            obscureText: controllerSenha.obscureText,
                          );
                        }
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * .03),
                    CustomButton(
                      onPressed: () async {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return Container(
                              color: Colors.transparent,
                              child: Center(
                                child: SpinKitWave(
                                  itemBuilder: (BuildContext context, int index) {
                                    return const DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: AppColors.yellow,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                        await controller.authenticate(emailController.text, senhaController.text);
                        Navigator.pop(context);
                        if (controller.isAuthenticated) {
                          Modular.to.pushReplacementNamed('/pedidos');
                        } else {
                          AppDialogs.showErrorDialog(
                            context,
                            'Erro de Autenticação',
                            'Credenciais inválidas. Tente novamente.',
                          );
                          emailController.clear();
                          senhaController.clear();
                        }
                      }, texto: 'Entrar',
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * .01),
                    CustomButtonWhite(
                      onPressed: () async {
                        AppDialogs.showEmailDialog(
                          context,
                          'Digite seu E-mail',
                        );
                      },
                      texto: 'Esqueci minha senha',
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn(duration: 500.ms).slideX(delay: 1.microseconds, begin: 2.0),
          ),
        ],
      ),
    );
  }


}
