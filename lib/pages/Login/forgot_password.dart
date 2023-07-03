import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/pages/Login/signin_page.dart';
import 'package:jogo_mobile_app/services/user.service.dart';
import 'package:jogo_mobile_app/widgets/failed_modal.dart';
import 'package:jogo_mobile_app/widgets/success_modal.dart';
import 'package:jogo_mobile_app/widgets/text.form.global.dart';

class ForgotPassword extends StatelessWidget {
  final TextEditingController forgotpasswordController =
      TextEditingController();
  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                    width: 280,
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  'Recuperar contraseña',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Por favor, introduzca una su correo electrónico para restablecer su contraseña.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                
                TextFormGlobal(
                  controller: forgotpasswordController,
                  text: 'Contraseña',
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    sendForgotPasswordEmail(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(49, 220, 118, 1.0),
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                          )
                        ]),
                    child: const Text(
                      'Confirmar',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sendForgotPasswordEmail(context) async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Enviando correo de recuperación de contraseña...'),
      backgroundColor: Colors.green,
    ));

    Response response = await userService.forgotPassword(
        context, forgotpasswordController.text);
    dynamic res = response.data;
    if (ModalRoute.of(context)!.isCurrent) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }

    if (res["message"] != "") {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return const SuccessModal(
            title: 'Correo enviado',
            description:
                'El correo ha sido enviado exitosamente. Por favor, revisa tu correo electrónico y sigue las instrucciones.',
          );
        },
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SignIn()),
      );
    } else {
      List<dynamic> errors = res['errors'];
      List<String> castedErrors = errors.cast<String>();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return FailedModal(
            title: 'Error en el envío',
            description: castedErrors.join('\n'),
          );
        },
      );
    }
  }
}
