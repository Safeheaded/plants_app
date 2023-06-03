import 'package:am_project/main.dart';
import 'package:am_project/router/root_router.dart';
import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (supabase.auth.currentSession != null ||
        (resolver.route.name == LoginRoute.name &&
            supabase.auth.currentSession == null)) {
      // we continue navigation
      resolver.next();
    } else {
      // else we navigate to the Login page so we get authenticateed

      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(const LoginRoute());
    }
  }
}
