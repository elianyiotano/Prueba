import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/models/user.dart';
import 'package:jogo_mobile_app/pages/coupons_page.dart';
import 'package:jogo_mobile_app/pages/events_page.dart';
import 'package:jogo_mobile_app/pages/notification_page.dart';
import 'package:jogo_mobile_app/pages/profile_page.dart';
import 'package:jogo_mobile_app/providers/ui_providers.dart';
import 'package:jogo_mobile_app/widgets/scan_button.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_navigatorbar.dart';

class HomePage extends StatelessWidget {
  final User user;

  HomePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _HomePageBody(user: user),
      ),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ScanButton(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  final User user;

  _HomePageBody({required this.user});

  @override
  Widget build(BuildContext context) {
    final uiProviders = Provider.of<UiProviders>(context);
    final currentIndex = uiProviders.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return EventsPage();
      case 1:
        return CouponsPage();
      case 2:
        return NotificationPage();
      case 3:
        return ProfilePage(user: user);
      default:
        return CouponsPage();
    }
  }
}
