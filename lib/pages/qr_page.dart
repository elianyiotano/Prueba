import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/widgets/custom_navigatorbar.dart';

class QrPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('QR Page'),
      ),
      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
