// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jogo_mobile_app/pages/events_page.dart';
import 'package:jogo_mobile_app/pages/notification_page.dart';
import 'package:jogo_mobile_app/pages/profile_page.dart';
import 'package:jogo_mobile_app/pages/ranking_page.dart';
import 'package:jogo_mobile_app/providers/ui_providers.dart';
import 'package:jogo_mobile_app/widgets/scan_button.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_navigatorbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: ScanButton(),
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //obtener el selected menu opt
    final uiProviders = Provider.of<UiProviders>(context);
    final currentIndex = uiProviders.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return EventsPage();
      case 1:
        return EventsPage();
      case 2:
        return RankingPage();
      case 3:
        return ProfilePage();
      default:
        return EventsPage();
    }
  }
}
