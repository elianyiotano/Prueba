import 'package:auto_route/auto_route.dart';
import 'package:jogo_mobile_app/pages/Login/signin_page.dart';
import 'package:jogo_mobile_app/pages/Login/signup_Page.dart';
import 'package:jogo_mobile_app/pages/home_page.dart';
import 'package:jogo_mobile_app/pages/notification_page.dart';
import 'package:jogo_mobile_app/pages/profile_page.dart';
import 'package:jogo_mobile_app/pages/qr_page.dart';
import 'package:jogo_mobile_app/pages/ranking_page.dart';
import 'package:jogo_mobile_app/routes.guard.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      page: SignIn,
      initial: true,
      name: 'SignInRoute',
      path: '/signin',
    ),
    AutoRoute(
      page: SignUp,
      initial: true,
      name: 'SignUpRoute',
      path: '/signup',
    ),
    AutoRoute(
      page: HomePage,
      name: 'HomeRoute',
      path: '/',
      guards: [RouteGuard],
    ),
    AutoRoute(
      page: NotificationPage,
      name: 'NotificationRoute',
      path: '/notification',
      guards: [RouteGuard],
    ),
    AutoRoute(
      page: ProfilePage,
      name: 'ProfileRoute',
      path: '/profile',
      guards: [RouteGuard],
    ),
    AutoRoute(
      page: QrPage,
      name: 'QrRoute',
      path: '/qr',
      guards: [RouteGuard],
    ),
    AutoRoute(
      page: RankingPage,
      name: 'RankingRoute',
      path: '/ranking',
      guards: [RouteGuard],
    ),
  ],
)
class $AppRouter {}
