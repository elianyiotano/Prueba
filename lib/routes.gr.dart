// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import 'pages/home_page.dart' as _i3;
import 'pages/Login/signin_page.dart' as _i1;
import 'pages/Login/signup_Page.dart' as _i2;
import 'pages/notification_page.dart' as _i4;
import 'pages/profile_page.dart' as _i5;
import 'pages/qr_page.dart' as _i6;
import 'pages/ranking_page.dart' as _i7;
import 'routes.guard.dart' as _i10;

class AppRouter extends _i8.RootStackRouter {
  AppRouter({
    _i9.GlobalKey<_i9.NavigatorState>? navigatorKey,
    required this.routeGuard,
  }) : super(navigatorKey);

  final _i10.RouteGuard routeGuard;

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    SignInRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SignIn(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.SignUp(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.HomePage(),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.NotificationPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.ProfilePage(),
      );
    },
    QrRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.QrPage(),
      );
    },
    RankingRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.RankingPage(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          SignInRoute.name,
          path: '/signin',
        ),
        _i8.RouteConfig(
          SignUpRoute.name,
          path: '/signup',
        ),
        _i8.RouteConfig(
          HomeRoute.name,
          path: '/',
          guards: [routeGuard],
        ),
        _i8.RouteConfig(
          NotificationRoute.name,
          path: '/notification',
          guards: [routeGuard],
        ),
        _i8.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
          guards: [routeGuard],
        ),
        _i8.RouteConfig(
          QrRoute.name,
          path: '/qr',
          guards: [routeGuard],
        ),
        _i8.RouteConfig(
          RankingRoute.name,
          path: '/ranking',
          guards: [routeGuard],
        ),
      ];
}

/// generated route for
/// [_i1.SignIn]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/signin',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i2.SignUp]
class SignUpRoute extends _i8.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signup',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.NotificationPage]
class NotificationRoute extends _i8.PageRouteInfo<void> {
  const NotificationRoute()
      : super(
          NotificationRoute.name,
          path: '/notification',
        );

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [_i5.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute()
      : super(
          ProfileRoute.name,
          path: '/profile',
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i6.QrPage]
class QrRoute extends _i8.PageRouteInfo<void> {
  const QrRoute()
      : super(
          QrRoute.name,
          path: '/qr',
        );

  static const String name = 'QrRoute';
}

/// generated route for
/// [_i7.RankingPage]
class RankingRoute extends _i8.PageRouteInfo<void> {
  const RankingRoute()
      : super(
          RankingRoute.name,
          path: '/ranking',
        );

  static const String name = 'RankingRoute';
}
