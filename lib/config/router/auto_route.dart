import 'package:auto_route/auto_route.dart';
import 'package:maga/config/router/auto_const.dart';
import 'package:maga/config/router/auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    // Home
    AutoRoute(path: AutoConst.homePage, page: HomeRoute.page, initial: true),
    // Category
    AutoRoute(
      path: '${AutoConst.categoryPage}/:id',
      page: ManageCategoryRoute.page,
    ),
    // Image
    AutoRoute(
      path: '${AutoConst.imagePage}/:id',
      page: ImageRoute.page,
    ),
  ];

  @override
  List<AutoRouteGuard> get guards => [];
}
