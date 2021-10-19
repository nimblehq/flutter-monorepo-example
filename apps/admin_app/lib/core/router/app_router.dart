import 'package:admin_app/core/router/app_routes.dart';
import 'package:admin_app/core/router/app_routes_handler.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppRouter {
  final FluroRouter _router;
  final GlobalKey<NavigatorState> navigatorKey;
  AppRouter(this._router, this.navigatorKey) {
    _configureRoutes();
  }

  BuildContext getNavigatorContext() => navigatorKey.currentContext!;

  Route<dynamic> generateRoutes(RouteSettings routeSettings) =>
      _router.generator(routeSettings)!;

  void navigateTo(String page,
      {Object? argument,
      bool replace = false,
      bool clearStack = false,
      TransitionType? transition}) {
    _router.navigateTo(
      getNavigatorContext(),
      page,
      routeSettings: RouteSettings(
        arguments: argument,
      ),
      replace: replace,
      clearStack: clearStack,
      transition: transition,
    );
  }

  void navigateBack() {
    _router.pop(getNavigatorContext());
  }

  void _configureRoutes() {
    _router.notFoundHandler = Handler(
      handlerFunc: (context, params) {
        //TODO: Handle not found routes
        return Center(child: Text('Not found routes!'));
      },
    );

    _router.define(AppRoutes.ROOT, handler: rootHandler);
  }
}
