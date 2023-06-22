import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/main.dart';
import 'package:jogo_mobile_app/models/user.dart';
import 'package:jogo_mobile_app/pages/Login/signup_Page.dart';
import 'package:jogo_mobile_app/routes.gr.dart';
import 'package:jogo_mobile_app/services/user.service.dart';
import 'package:jogo_mobile_app/widgets/button.global.dart';
import 'package:jogo_mobile_app/widgets/failed_modal.dart';
import 'package:jogo_mobile_app/widgets/social.login.dart';
import 'package:jogo_mobile_app/widgets/text.form.global.dart';
import 'package:flutter/material.dart';

import '../../widgets/success_modal.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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

                // EmailInput
                TextFormGlobal(
                  controller: emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 10),

                // PasswordInput
                TextFormGlobal(
                  controller: passwordController,
                  text: 'Password',
                  textInputType: TextInputType.text,
                  obscure: true,
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      loginUsers(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      padding: const EdgeInsets.all(16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                SocialLogin(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t have an account?'),
            TextButton(
              onPressed: (){
                Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Text("Sign Up", style: TextStyle(
                  color: Color.fromRGBO(49, 220, 118, 1.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loginUsers(context) async {
    if (true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Iniciando sesión...'),
          duration: Duration(seconds: 5),
          backgroundColor: Colors.green,
        ),
      );

      Response response = await userService.login(
        emailController.text,
        passwordController.text,
      );
      dynamic res = response.data;
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }

      if (res['error'] == null && res["token"] != "") {
        if (mounted) {
          var authService = MyApp.of(context).authService;
          authService.authenticated = true;
          authService.email = emailController.text;
          authService.token_auth =
              response.headers.value("Authorization") ?? "";
          MyApp.of(context).userData = UserData.fromJson(res);
          AutoRouter.of(context).replace(const HomeRoute());
        }
      } else {
        dynamic errors = res['error'];
        String castedErrors = errors.toString();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const FailedModal(
              title: 'Error de inicio de sesión',
              description:
                  'Usuario o contraseña incorrecta. Por favor, ingrese su usuario y contraseña correcto.',
            );
          },
        );
      }
    }
  }
}
