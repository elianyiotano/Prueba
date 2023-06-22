import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/main.dart';
import 'package:jogo_mobile_app/models/user.dart';
import 'package:jogo_mobile_app/pages/Login/signin_page.dart';
import 'package:jogo_mobile_app/services/user.service.dart';
import 'package:jogo_mobile_app/widgets/button_sign_up.dart';
import 'package:jogo_mobile_app/widgets/social.login.dart';
import 'package:jogo_mobile_app/widgets/text.form.global.dart';

class SignUp extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
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
                  text: 'Full name',
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
          passwordController.text, nameController.text, phoneController.text);
      dynamic res = response.data;

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['ErrorCode'] == null && res["success"] != "") {
        var authService = MyApp.of(context).authService;
        authService.authenticated = true;
        authService.token_auth = response.headers.value("Authorization") ?? "";
        MyApp.of(context).userData = UserData.fromJson(res);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      } else {
        if (res["errors"].containsKey("email")) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            // ignore: use_build_context_synchronously
            content: Text(
                '${res['errors']['email']}'.replaceAll(RegExp(r'[\[\]]'), '')),
            // ignore: use_build_context_synchronously
            backgroundColor: Colors.red,
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            // ignore: use_build_context_synchronously
            content: Text('${res['errors']}'),
            // ignore: use_build_context_synchronously
            backgroundColor: Colors.red,
          ));
        }
        // ignore: use_build_context_synchronously
      }
    }
  }
}
