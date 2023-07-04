import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/pages/Login/signup_page.dart';
import 'package:jogo_mobile_app/pages/Login/signin_page.dart';

class TabNavigation extends StatelessWidget {
  const TabNavigation({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FF),
        borderRadius: BorderRadius.circular(44),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        children: [
          Expanded(
            child: TabItem(
              label: 'Iniciar sesión',
              isSelected: true,
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 4.0),
          Expanded(
            child: TabItem(
              label: 'Registrarse',
              isSelected: false,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUp()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  const TabItem({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 48,
        padding: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFFF6F7FF),
          borderRadius: isSelected ? BorderRadius.circular(44) : null,
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 15,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? Colors.black : const Color(0xFF525E7B),
            ),
          ),
        ),
      ),
    );
  }
}
