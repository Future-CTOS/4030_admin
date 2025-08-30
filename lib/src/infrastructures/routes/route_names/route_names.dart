import '../route_paths/route_paths.dart';

class Route {
  final String uri;
  final String path;

  const Route(this.uri, [final String? path]) : path = path ?? uri;
}

class RouteNames extends Route {
  RouteNames(super.uri);

  static const Route splashScreen = Route(
    RoutePaths.splashScreen,
    RoutePaths.splashScreen,
  );

  static const Route dashboard = Route(
    RoutePaths.dashboard,
    RoutePaths.dashboard,
  );

}
