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
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import 'models/coupon.dart' as _i14;
import 'models/event.dart' as _i15;
import 'models/user.dart' as _i13;
import 'pages/detail_page.dart' as _i4;
import 'pages/detailEvent_page.dart' as _i9;
import 'pages/events_page.dart' as _i8;
import 'pages/home_page.dart' as _i3;
import 'pages/Login/signin_page.dart' as _i1;
import 'pages/Login/signup_Page.dart' as _i2;
import 'pages/notification_page.dart' as _i5;
import 'pages/profile_page.dart' as _i6;
import 'pages/ranking_page.dart' as _i7;
import 'routes.guard.dart' as _i12;

class AppRouter extends _i10.RootStackRouter {
  AppRouter({
    _i11.GlobalKey<_i11.NavigatorState>? navigatorKey,
    required this.routeGuard,
  }) : super(navigatorKey);

  final _i12.RouteGuard routeGuard;

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    SignInRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.SignIn(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignUp(),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.HomePage(user: args.user),
      );
    },
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.DetailPage(coupon: args.coupon),
      );
    },
    NotificationRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.NotificationPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      final args = routeData.argsAs<ProfileRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ProfilePage(user: args.user),
      );
    },
    RankingRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.RankingPage(),
      );
    },
    EventRoute.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.EventsPage(),
      );
    },
    DetailEventRoute.name: (routeData) {
      final args = routeData.argsAs<DetailEventRouteArgs>();
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.DetailEventPage(event: args.event),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          SignInRoute.name,
          path: '/signin',
        ),
        _i10.RouteConfig(
          SignUpRoute.name,
          path: '/signup',
        ),
        _i10.RouteConfig(
          HomeRoute.name,
          path: '/',
          guards: [routeGuard],
        ),
        _i10.RouteConfig(
          DetailRoute.name,
          path: '/detail',
          guards: [routeGuard],
        ),
        _i10.RouteConfig(
          NotificationRoute.name,
          path: '/notification',
          guards: [routeGuard],
        ),
        _i10.RouteConfig(
          ProfileRoute.name,
          path: '/profile',
          guards: [routeGuard],
        ),
        _i10.RouteConfig(
          RankingRoute.name,
          path: '/ranking',
          guards: [routeGuard],
        ),
        _i10.RouteConfig(
          EventRoute.name,
          path: '/event',
          guards: [routeGuard],
        ),
        _i10.RouteConfig(
          DetailEventRoute.name,
          path: '/detail',
          guards: [routeGuard],
        ),
      ];
}

/// generated route for
/// [_i1.SignIn]
class SignInRoute extends _i10.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/signin',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i2.SignUp]
class SignUpRoute extends _i10.PageRouteInfo<void> {
  const SignUpRoute()
      : super(
          SignUpRoute.name,
          path: '/signup',
        );

  static const String name = 'SignUpRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i10.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({required _i13.User user})
      : super(
          HomeRoute.name,
          path: '/',
          args: HomeRouteArgs(user: user),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({required this.user});

  final _i13.User user;

  @override
  String toString() {
    return 'HomeRouteArgs{user: $user}';
  }
}

/// generated route for
/// [_i4.DetailPage]
class DetailRoute extends _i10.PageRouteInfo<DetailRouteArgs> {
  DetailRoute({required _i14.Coupon coupon})
      : super(
          DetailRoute.name,
          path: '/detail',
          args: DetailRouteArgs(coupon: coupon),
        );

  static const String name = 'DetailRoute';
}

class DetailRouteArgs {
  const DetailRouteArgs({required this.coupon});

  final _i14.Coupon coupon;

  @override
  String toString() {
    return 'DetailRouteArgs{coupon: $coupon}';
  }
}

/// generated route for
/// [_i5.NotificationPage]
class NotificationRoute extends _i10.PageRouteInfo<void> {
  const NotificationRoute()
      : super(
          NotificationRoute.name,
          path: '/notification',
        );

  static const String name = 'NotificationRoute';
}

/// generated route for
/// [_i6.ProfilePage]
class ProfileRoute extends _i10.PageRouteInfo<ProfileRouteArgs> {
  ProfileRoute({required _i13.User user})
      : super(
          ProfileRoute.name,
          path: '/profile',
          args: ProfileRouteArgs(user: user),
        );

  static const String name = 'ProfileRoute';
}

class ProfileRouteArgs {
  const ProfileRouteArgs({required this.user});

  final _i13.User user;

  @override
  String toString() {
    return 'ProfileRouteArgs{user: $user}';
  }
}

/// generated route for
/// [_i7.RankingPage]
class RankingRoute extends _i10.PageRouteInfo<void> {
  const RankingRoute()
      : super(
          RankingRoute.name,
          path: '/ranking',
        );

  static const String name = 'RankingRoute';
}

/// generated route for
/// [_i8.EventsPage]
class EventRoute extends _i10.PageRouteInfo<void> {
  const EventRoute()
      : super(
          EventRoute.name,
          path: '/event',
        );

  static const String name = 'EventRoute';
}

/// generated route for
/// [_i9.DetailEventPage]
class DetailEventRoute extends _i10.PageRouteInfo<DetailEventRouteArgs> {
  DetailEventRoute({required _i15.Event event})
      : super(
          DetailEventRoute.name,
          path: '/detail',
          args: DetailEventRouteArgs(event: event),
        );

  static const String name = 'DetailEventRoute';
}

class DetailEventRouteArgs {
  const DetailEventRouteArgs({required this.event});

  final _i15.Event event;

  @override
  String toString() {
    return 'DetailEventRouteArgs{event: $event}';
  }
}
