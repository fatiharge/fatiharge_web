import 'package:auto_route/auto_route.dart';
import 'package:fatiharge/app/init/bloc/init_cubit.dart';
import 'package:fatiharge/product/route/route_manager.gr.dart';

class InitGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (InitCubit.initCompleted || InitRoute.page.name == resolver.routeName) {
      resolver.next();
    } else {
      router.push(const InitRoute());
    }
  }
}
