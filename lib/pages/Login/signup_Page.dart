import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/pages/Login/signin_page.dart';
import 'package:jogo_mobile_app/services/user.service.dart';
import 'package:jogo_mobile_app/widgets/tab_navigation_sign_Up.dart';

import '../../widgets/failed_modal.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formfield = GlobalKey<FormState>();
  bool passToggle = true;
  String? termsError;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastName1Controller = TextEditingController();
  final TextEditingController lastName2Controller = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();

  bool? isChecked = true;
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
                      height: 150,
                      width: 150,
                    ),
                    TabNavigationSignUp(),
                    const SizedBox(height: 20),
                    //referralCodeController
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: referralCodeController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: "Código de referencia",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    //NameController
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: nameController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: "Nombre",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo requerido.";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    //LastNameController
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: lastName1Controller,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: "Primer apellido",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo requerido.";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    //SecondLastNameController
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: lastName2Controller,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: "Segundo apellido",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo requerido.";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    //PhoneController
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: "Teléfono",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo requerido.";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    //EmailController
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
                    const SizedBox(height: 20),
                    //PasswordInput
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: passwordController,
                      obscureText: passToggle,
                      decoration: InputDecoration(
                          labelText: "Contraseña",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
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
                          return "Su contraseña debe contener un mínimo 6 caracteres";
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    //Accept Terms and policy
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('Terms & Privacy Policy'),
                              content: Text(
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
                                Text(
                                  'I accept',
                                  style: TextStyle(
                                    height: 1,
                                    color:
                                        const Color.fromARGB(255, 55, 54, 54),
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
                                        title: Text(
                                            'Términos y política de privacidad '),
                                        content: Text(
                                          'Here you can display the terms and privacy policy.',
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text('Close'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Terms and policies',
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
                                //isChecked = value!;
                                isChecked = true;
                              });
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        if (_formfield.currentState!.validate()) {
                          createUsers(context);
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
                          'Registrarte',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ]),
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
        phoneController.text,
        referralCodeController.text,
      );
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
