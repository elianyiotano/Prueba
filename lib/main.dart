import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/pages/Login/signin_page.dart';
import 'package:jogo_mobile_app/pages/Login/signup_Page.dart';
import 'package:jogo_mobile_app/pages/home_page.dart';
import 'package:jogo_mobile_app/pages/notification_page.dart';
import 'package:jogo_mobile_app/pages/profile_page.dart';
import 'package:jogo_mobile_app/pages/qr_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jogo',
      debugShowCheckedModeBanner: false,
      initialRoute: 'signin',
      routes: {
        'home': (_) => HomePage(),
        'notification': (_) => NotificationPage(),
        'profile': (_) => ProfilePage(),
        'qr': (_) => QrPage(),
        'signin': (_) => SignIn(),
        'signup': (_) => SignUp(),
      },
      theme: ThemeData.light(),
    );
  }
}
