import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialLogin extends StatelessWidget {
    const SocialLogin({Key? key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: const Text(
            'Or sign in with',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Row(
            children: [
              //Google
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.1), blurRadius: 10),
                      ]),
                  child: SvgPicture.asset(
                    'assets/images/google.svg',
                    height: 30,
                  ),
                ),
              ),
              const SizedBox(width: 15),
              //Facebook
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.1), blurRadius: 10),
                      ]),
                  child: SvgPicture.asset(
                    'assets/images/facebook.svg',
                    height: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
