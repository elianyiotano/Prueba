import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/pages/Login/signin_page.dart';
import 'package:jogo_mobile_app/services/user.service.dart';
import 'package:jogo_mobile_app/widgets/failed_modal.dart';
import 'package:jogo_mobile_app/widgets/social.login.dart';
import 'package:jogo_mobile_app/widgets/text.form.global.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastName1Controller = TextEditingController();
  final TextEditingController lastName2Controller = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool? isChecked = false;
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
                    height: 169,
                    width: 300,
                  ),
                ),

                const SizedBox(height: 15),

                TextFormGlobal(
                  controller: nameController,
                  text: 'Nombre',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),

                TextFormGlobal(
                  controller: lastName1Controller,
                  text: 'Primer Apellido',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),

                TextFormGlobal(
                  controller: lastName2Controller,
                  text: 'Segundo Apellido',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),

                TextFormGlobal(
                  controller: phoneController,
                  text: 'Teléfono',
                  obscure: false,
                  textInputType: TextInputType.phone,
                ),
                const SizedBox(height: 10),

                TextFormGlobal(
                  controller: emailController,
                  text: 'Correo Electrónico',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 10),

                PasswordTextForm(
                  controller: passwordController,
                  text: 'Contraseña',
                  textInputType: TextInputType.text,
                  onVisibilityChanged: (bool obscure) {},
                ),
                const SizedBox(height: 10),

                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Términos y Política de Privacidad'),
                          content: const Text(
                            'Here you can display the terms and privacy policy.',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 1),
                        ],
                        color: Color.fromARGB(255, 235, 238, 235),
                      ),
                      child: CheckboxListTile(
                        title: Row(
                          children: [
                            const Text(
                              'Acepto ',
                              style: TextStyle(
                                height: 1,
                                color: Color.fromARGB(255, 55, 54, 54),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Términos y Política de Privacidad'),
                                    content: const Text(
                                      'Here you can display the terms and privacy policy.',
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Close'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: const Text(
                                'Términos y Política de Privacidad',
                                style: TextStyle(
                                  height: 1,
                                  color: Colors.green,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        value: isChecked,
                        activeColor: Colors.transparent,
                        checkColor: Colors.green,
                        tileColor: Colors.transparent,
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),
                InkWell(
                  onTap: () {
                    createUsers(context);
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
                      'Registrar',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                const SocialLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createUsers(context) async {
    if (true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Creando cuenta...'),
            duration: Duration(seconds: 4),
            backgroundColor: Colors.green),
      );

      Response response = await userService.create(
          emailController.text,
          passwordController.text,
          nameController.text,
          lastName1Controller.text,
          lastName2Controller.text,
          phoneController.text);
      dynamic res = response.data;

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['error'] == null && res["token"] != "") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registro exitoso! Inicia sesión...'),
            duration: Duration(seconds: 5),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      } else {
        if (res["error"] != "") {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return FailedModal(
                title: 'Error en el envío',
                description: res["error"],
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return FailedModal(
                title: 'Ha ocurrido un error',
                description:
                    "Por favor verifique su conexión a internet y que la información proporcionada sea correcta. ",
              );
            },
          );
        }
      }
    }
  }
}

class PasswordTextForm extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final ValueChanged<bool> onVisibilityChanged;

  const PasswordTextForm({
    required this.controller,
    required this.text,
    required this.textInputType,
    required this.onVisibilityChanged,
  });

  @override
  _PasswordTextFormState createState() => _PasswordTextFormState();
}

class _PasswordTextFormState extends State<PasswordTextForm> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(top: 3, left: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 1),
        ],
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText: obscure,
        style: const TextStyle(fontSize: 16),
        decoration: InputDecoration(
          hintText: widget.text,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(top: 15),
          hintStyle: const TextStyle(
            fontSize: 16,
            height: 1,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscure = !obscure;
              });
              widget.onVisibilityChanged(obscure);
            },
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
