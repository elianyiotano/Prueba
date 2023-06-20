import 'package:auto_route/auto_route.dart';
import 'package:jogo_mobile_app/routes.gr.dart';
import 'package:jogo_mobile_app/services/auth.service.dart';

class RouteGuard extends AutoRouteGuard {
  final AuthService authService;

  RouteGuard(this.authService) {
    authService.addListener(() {
      if (!authService.authenticated) {
        // reevaluate();
      }
    });
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authService.authenticated) return resolver.next();

    router.push(SignInRoute());    

    // router.push(
    //   LoginRoute(
    //     onLoginCallback: (_) {
    //       router.removeLast();
    //       router.replace(HomeRoute());
    //     },
    //   ),
    // );
  }
}
