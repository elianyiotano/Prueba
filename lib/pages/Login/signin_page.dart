// ignore_for_file: unused_local_variable, sort_child_properties_last, prefer_const_constructors

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/main.dart';
import 'package:jogo_mobile_app/models/user.dart';
import 'package:jogo_mobile_app/pages/Login/forgot_password.dart';
import 'package:jogo_mobile_app/pages/Login/signup_Page.dart';
import 'package:jogo_mobile_app/routes.gr.dart';
import 'package:jogo_mobile_app/services/user.service.dart';
import 'package:jogo_mobile_app/widgets/failed_modal.dart';
import 'package:jogo_mobile_app/widgets/social.login.dart';
import 'package:jogo_mobile_app/widgets/tab_navigation.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formfield = GlobalKey<FormState>();
  bool passToggle = true;
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
            child: Form(
              key: _formfield,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/JOGO.png',
                    height: 200,
                    width: 200,
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
                PasswordTextForm(
                  controller: passwordController,
                  text: 'Password',
                  textInputType: TextInputType.text,
                  onVisibilityChanged: (bool obscure) {},
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  child: const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
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
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
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
          authService.token_auth = res["token"] ?? "";

          MyApp.of(context).userData = UserData.fromJson(res);
          User user = User.fromJson(res["user"]);

          AutoRouter.of(context).replace(HomeRoute(user: user));
        }
      } else {
        dynamic errors = res['error'];
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return FailedModal(
              title: 'Error de inicio de sesión',
              description: errors,
            );
          },
        );
      }
    }
  }
}
