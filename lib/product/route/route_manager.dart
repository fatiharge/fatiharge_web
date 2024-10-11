import 'package:auto_route/auto_route.dart';
import 'package:fatiharge/product/route/guard/init_guard.dart';
import 'package:fatiharge/product/route/route_manager.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class RouteManager extends RootStackRouter {
  // @override
  // RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: HomeRoute.page,
          initial: true,
        ),
        AutoRoute(path: '/loading', page: InitRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [InitGuard()];
}
