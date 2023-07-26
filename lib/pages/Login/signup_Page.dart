// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
  final FocusNode referralCodeFocusNode = FocusNode();
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
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 0,
      ),
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
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: referralCodeController,
                      focusNode: referralCodeFocusNode,
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: "Código de activación",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                    //NameController
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
                                  'Acepto',
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
                                            'Términos y política de privacidad'),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Agradecemos tu interés en nuestra aplicación Jogo. La privacidad de tus datos personales es importante para nosotros. A continuación, te explicamos cómo recopilamos, utilizamos y protegemos la información que nos proporcionas.',
                                                textAlign: TextAlign
                                                    .justify, // justify the text
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                'Información que recopilamos:',
                                                style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold), // Bold title
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                '• Nombre y apellido: Recopilamos esta información para personalizar tu experiencia dentro de la aplicación.',
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                '• Correo electrónico: Solicitamos tu dirección de correo electrónico para enviar información relevante sobre promociones y novedades.',
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                '• Número de teléfono (opcional): Si decides proporcionarnos tu número de teléfono, lo utilizaremos únicamente para enviar notificaciones relacionadas con los cupones y promociones que podrían ser de tu interés.',
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                'Uso de la información:',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                '• Utilizamos tu nombre y apellido para personalizar tu experiencia dentro de la aplicación.',
                                                textAlign: TextAlign.justify,
                                              ),

                                              Text(
                                                '• Tu dirección de correo electrónico se utiliza para enviarte información sobre promociones y novedades relacionadas con nuestros servicios.',
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                'Protección de la información:',
                                                style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold), // Bold title
                                              ),
                                              SizedBox(
                                                  height:
                                                      10), // Add some margin between title and text
                                              Text(
                                                '• Tomamos medidas de seguridad para proteger tus datos personales contra acceso no autorizado, pérdida o alteración.',
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                '• Solo permitimos el acceso a tu información personal a aquellos empleados y colaboradores que necesiten conocerla para brindarte un mejor servicio.',
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                'Divulgación de la información:',
                                                style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold), // Bold title
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                '• No vendemos, intercambiamos ni transferimos tu información personal a terceros sin tu consentimiento, a menos que sea necesario para brindarte nuestros servicios o cumplir con las leyes aplicables.',
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                'Tus derechos:',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                  height:
                                                      10), // Add some margin between title and text
                                              Text(
                                                '• Tienes derecho a acceder, corregir o eliminar cualquier información personal que hayas proporcionado.',
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                '• Si deseas modificar tus preferencias de comunicación o eliminar tus datos de nuestra base de datos, puedes contactarnos a través de los medios proporcionados al final de esta política.',
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                'Cambios en la política de privacidad:',
                                                style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold), // Bold title
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                '• Nos reservamos el derecho de modificar esta política de privacidad en cualquier momento. Cualquier cambio será notificado a través de nuestra aplicación o por correo electrónico.',
                                                textAlign: TextAlign.justify,
                                              ),
                                              SizedBox(height: 15),
                                              Text(
                                                'Contacto',
                                                style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold), // Bold title
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                'Correo electrónico:',
                                                style: TextStyle(
                                                    fontWeight: FontWeight
                                                        .bold), // Bold title
                                              ),
                                              Text(
                                                'contact@peppermind.io',
                                                textAlign: TextAlign.justify,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text('Cerrar'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'los términos y políticas.',
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
              referralCodeFocusNode.requestFocus();
              return FailedModal(
                title: 'Error en el envío',
                description: "Código de activación invalido",
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
