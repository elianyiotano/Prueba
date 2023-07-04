import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/pages/Login/signin_page.dart';
import 'package:jogo_mobile_app/services/user.service.dart';
import 'package:jogo_mobile_app/widgets/failed_modal.dart';
import 'package:jogo_mobile_app/widgets/success_modal.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPassword createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();
  final _formfield = GlobalKey<FormState>();
  UserService userService = UserService();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: _formfield,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/JOGO.png',
                    height: 150,
                    width: 150,
                  ),
                ),
                const SizedBox(height: 22),
                const Text(
                  'Recuperar contraseña',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Por favor, introduzca su correo electrónico para restablecer su contraseña.',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                //PasswordInput
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: "Correo electrónico",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  validator: (value) {
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[A-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value!);
                    if (value.isEmpty) {
                      return "Campo requerido.";
                    } else if (!emailValid) {
                      return "Ingrese un correo valido";
                    }
                  },
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    if (_formfield.currentState!.validate()) {
                      sendForgotPasswordEmail(context);
                    }
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
        )),
      ),
    );
  }

  Future<void> sendForgotPasswordEmail(context) async {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Enviando correo de recuperación de contraseña...'),
      backgroundColor: Colors.green,
    ));

    Response response =
        await userService.forgotPassword(context, emailController.text);
    dynamic res = response.data;
    if (ModalRoute.of(context)!.isCurrent) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }

    if (res['error'] == null && res["message"] != "") {
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
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return FailedModal(
            title: 'Error en el envío del correo ',
            description: res['error'],
          );
        },
      );
    }
  }
}
