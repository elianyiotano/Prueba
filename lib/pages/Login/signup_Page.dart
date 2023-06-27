import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/pages/Login/signin_page.dart';
import 'package:jogo_mobile_app/services/user.service.dart';
import 'package:jogo_mobile_app/widgets/social.login.dart';
import 'package:jogo_mobile_app/widgets/text.form.global.dart';

class SignUp extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastName1Controller = TextEditingController();
  final TextEditingController lastName2Controller = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
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

                //NameInput
                TextFormGlobal(
                  controller: nameController,
                  text: 'Nombre',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),

                Row(children: [],),
                //NameInput
                TextFormGlobal(
                  controller: lastName1Controller,
                  text: 'Primer Apellido',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),

                //NameInput
                TextFormGlobal(
                  controller: lastName2Controller,
                  text: 'Segundo Apellido',
                  obscure: false,
                  textInputType: TextInputType.text,
                ),
                const SizedBox(height: 10),

                //PhoneInput
                TextFormGlobal(
                  controller: phoneController,
                  text: 'Phone Number',
                  obscure: false,
                  textInputType: TextInputType.phone,
                ),
                const SizedBox(height: 10),

                //EmailInput
                TextFormGlobal(
                  controller: emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 10),

                //PasswordInput
                TextFormGlobal(
                  controller: passwordController,
                  text: 'Password',
                  textInputType: TextInputType.text,
                  obscure: true,
                ),

                const SizedBox(height: 10),
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
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
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
            duration: Duration(seconds: 5),
            backgroundColor: Colors.green),
      );
  
      Response response = await userService.create(emailController.text,
          passwordController.text, nameController.text, lastName1Controller.text, lastName2Controller.text, phoneController.text);
      dynamic res = response.data;

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['error'] == null && res["token"] != "") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      } else {
        if (res["error"] != "") {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            // ignore: use_build_context_synchronously
            content: Text(res["error"]),
            // ignore: use_build_context_synchronously
            backgroundColor: Colors.red,
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            // ignore: use_build_context_synchronously
            content: Text('Ha ocurrido un error'),
            // ignore: use_build_context_synchronously
            backgroundColor: Colors.red,
          ));
        }
        // ignore: use_build_context_synchronously
      }
    }
  }
}
