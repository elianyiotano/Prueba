import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/pages/home_page.dart';
import 'package:jogo_mobile_app/pages/mapa_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
        'mapa': (_) => MapaPage(),
      },
      theme: ThemeData.light(),
    );
  }
}
