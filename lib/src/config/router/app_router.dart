import 'package:auto_route/auto_route.dart';
import 'package:mentos_flutter/src/presentation/page/login/view/login.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    // AutoRoute(page: LoginRoute.page)
    /// routes go here
  ];
}
