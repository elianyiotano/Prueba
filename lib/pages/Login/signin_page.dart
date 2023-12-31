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
                  TabNavigation(),
                  const SizedBox(height: 30),
                  // EmailInput
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    obscureText: false,
                    decoration: InputDecoration(
                      labelText: "Correo electrónico",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      labelStyle: TextStyle(
                          fontFamily: 'SoinSansNeue',
                          fontWeight: FontWeight.w300),
                      errorStyle: TextStyle(
                        fontFamily: 'SoinSansNeue',
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
                  const SizedBox(height: 20),
                  // PasswordInput
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    obscureText: passToggle,
                    decoration: InputDecoration(
                        labelText: "Contraseña",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        labelStyle: TextStyle(
                            fontFamily: 'SoinSansNeue',
                            fontWeight: FontWeight.w300),
                        errorStyle: TextStyle(
                          fontFamily: 'SoinSansNeue',
                        ),
                        suffix: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(
                            passToggle
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 18,
                          ),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Campo requerido.";
                      } else if (passwordController.text.length < 6) {
                        return "Ingrese una contraseña valida.";
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()),
                      );
                    },
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "¿Olvidaste tu contraseña?",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'SoinSansNeue',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      if (_formfield.currentState!.validate()) {
                        loginUsers(context);
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
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
                        'Iniciar sesión',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'SoinSansNeue',
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
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
          content: Text(
            'Iniciando sesión...',
            style: TextStyle(
                fontFamily: 'SoinSansNeue', fontWeight: FontWeight.w300),
          ),
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
        String castedErrors = errors.toString();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return FailedModal(
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
