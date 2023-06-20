// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/pages/Login/change_password_page.dart';
import 'package:jogo_mobile_app/pages/Login/forgot_password.dart';
import 'package:jogo_mobile_app/pages/Login/signin_page.dart';
import 'package:jogo_mobile_app/pages/Login/signup_Page.dart';
import 'package:jogo_mobile_app/pages/home_page.dart';
import 'package:jogo_mobile_app/pages/notification_page.dart';
import 'package:jogo_mobile_app/pages/profile_page.dart';
import 'package:jogo_mobile_app/pages/qr_page.dart';
import 'package:jogo_mobile_app/pages/ranking_page.dart';
import 'package:jogo_mobile_app/providers/ui_providers.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProviders()),
      ],
      child: MaterialApp(
        title: 'Jogo',
        debugShowCheckedModeBanner: false,
        initialRoute: 'forgotpassword',
        routes: {
          'home': (_) => HomePage(),
          'notification': (_) => NotificationPage(),
          'profile': (_) => ProfilePage(),
          'qr': (_) => QrPage(),
          'signin': (_) => SignIn(),
          'signup': (_) => SignUp(),
          'ranking': (_) => RankingPage(),
          'changepassword': (_) => ChangePasswordPage(),
          'forgotpassword': (_) => ForgotPassword(),

        },
        theme: ThemeData(
          primaryColor: Color.fromRGBO(49, 220, 118, 1.0),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color.fromRGBO(49, 220, 118, 1.0),
          ),
        ),
      ),
    );
  }
}
