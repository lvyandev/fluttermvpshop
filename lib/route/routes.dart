import 'package:fluro/fluro.dart';
import 'route_handler.dart';

class Routes {
  static const ROOT = '/';
  static const PRODUCT_DETAILS = '/product_detail';

  static void configureRoutes(Router router) {
    router.notFoundHandler = routeNotFoundHandler;
    router.define(ROOT, handler: rootHandler);
    router.define(PRODUCT_DETAILS, handler: productDetailsHandler);
  }
}
