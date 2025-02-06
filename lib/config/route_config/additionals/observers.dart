import 'dart:developer';

import 'package:flutter/material.dart';

class MyNavigatorObserver extends NavigatorObserver {
  /// logs the details while pushing the route
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('push route :: \n'
        'current route :: $route'
        'previous route :: $previousRoute');
  }

  /// logs the details while popping the route
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('pop route :: \n'
        'current route :: $route'
        'previous route :: $previousRoute');
  }
}
