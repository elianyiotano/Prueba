import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/widgets/button.global.dart';
import 'package:jogo_mobile_app/widgets/social.login.dart';
import 'package:jogo_mobile_app/widgets/text.form.global.dart';

import '../../widgets/success_modal.dart';

class SignIn extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SuccessModal(
                            title: 'Successful validation',
                            description:
                                'Printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text.',
                          );
                        },
                      );
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
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Don\'t have an account?'),
            InkWell(
              child: Text(
                'Sign Up',
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
}
