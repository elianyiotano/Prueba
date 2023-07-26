import 'package:auto_route/auto_route.dart';
import 'package:jogo_mobile_app/pages/Login/signin_page.dart';
import 'package:jogo_mobile_app/pages/Login/signup_Page.dart';
import 'package:jogo_mobile_app/pages/detailEvent_page.dart';
import 'package:jogo_mobile_app/pages/detail_page.dart';
import 'package:jogo_mobile_app/pages/events_page.dart';
import 'package:jogo_mobile_app/pages/home_page.dart';
import 'package:jogo_mobile_app/pages/notification_page.dart';
import 'package:jogo_mobile_app/pages/profile_page.dart';
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
      page: DetailPage,
      name: 'DetailRoute',
      path: '/detail',
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
      page: RankingPage,
      name: 'RankingRoute',
      path: '/ranking',
      guards: [RouteGuard],
    ),
    AutoRoute(
      page: EventsPage,
      name: 'EventRoute',
      path: '/event',
      guards: [RouteGuard],
    ),
     AutoRoute(
      page: DetailEventPage,
      name: 'DetailEventRoute',
      path: '/detail',
      guards: [RouteGuard],
    ),
  ],
)
class $AppRouter {}
