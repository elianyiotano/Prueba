// ignore_for_file: unused_local_variable

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
import 'package:jogo_mobile_app/widgets/text.form.global.dart';

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
            const Text('Don\'t have an account?'),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
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
