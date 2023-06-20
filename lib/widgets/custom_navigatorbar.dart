// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/providers/ui_providers.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});
  @override
  Widget build(BuildContext context) {
    final uiProviders = Provider.of<UiProviders>(context);

    final currentIndex = uiProviders.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiProviders.selectedMenuOpt = i,
      currentIndex: currentIndex,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color.fromRGBO(49, 220, 118, 1),
      unselectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Eventos',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_active_outlined),
          label: 'Notificaciones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: 'Perfil',
        ),
      ],
    );
  }
}
