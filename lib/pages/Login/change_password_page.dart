import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/widgets/button_change_password.dart';
import 'package:jogo_mobile_app/widgets/text.form.global.dart';

class ChangePasswordPage extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  final TextStyle sectionHeaderStyle = const TextStyle(fontSize: 22);

  ChangePasswordPage({super.key});

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
                    'Cambiar contraseña',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Por favor, introduzca una nueva contraseña para cambiar su contraseña actual.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),

                TextFormGlobal(
                  controller: passwordController,
                  text: 'Contraseña',
                  obscure: true,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 15),

                TextFormGlobal(
                  controller: confirmController,
                  text: 'Confirmar contraseña',
                  obscure: true,
                  textInputType: TextInputType.text,
                  
                ),
                const SizedBox(height: 25),
                const ButtonChangePassword(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
