import 'package:features/core/router/features_routes.dart';
import 'package:features/core/router/features_routes_handler.dart';
import 'package:features/di/di.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class FeaturesRouter {
  late FluroRouter _router;
  late GlobalKey<NavigatorState> _navigatorKey;
  FeaturesRouter() {
    // FIXME create an abstract class for requesting the dependencies instead
    _router = featureGetIt.get();
    _navigatorKey = featureGetIt.get();
    _configRoutes();
  }

  void navigateTo(String page,
      {Object? argument,
      bool replace = false,
      bool clearStack = false,
      TransitionType? transition}) {
    _router.navigateTo(
      _navigatorKey.currentContext!,
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
    _router.pop(_navigatorKey.currentContext!);
  }

  void _configRoutes() {
    _router.define(
      FeaturesRoutes.SHARED_INFO,
      handler: sharedInfoHandler,
      transitionType: TransitionType.fadeIn,
    );

    _router.define(
      FeaturesRoutes.OTHER,
      handler: otherHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
