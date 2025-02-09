import 'package:employee_info/feat/add_emp_details/view/screen/add_emp_details_screen.dart';
import 'package:employee_info/feat/edit_emp_details/view/screen/edit_emp_details_screen.dart';
import 'package:employee_info/feat/misc/error/view/screen/error_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../feat/home/view/screen/home_screen.dart';
import '../../feat/misc/no_network/view/screen/view_screen.dart';
import 'additionals/route_transitions.dart';
import 'route_names.dart';

class RouteHandler {
  static final router = GoRouter(
    ///initial route and it will be the entry point for navigator api
    initialLocation: "/",

    /// To enable log output, enable the debugLogDiagnostics parameter:
    debugLogDiagnostics: true,

    /// navigator observe actions
    observers: [
      NavigatorObserver(),
    ],

    /// all the routes comes under these will acts as sub routes
    /// and children routes for the initial route
    routes: <RouteBase>[
      /// home screen
      GoRoute(
        path: "/",
        name: RouteNames.homeScreen,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: HomeScreen(),
        ),
      ),

      /// add emp screen
      GoRoute(
        path: RouteNames.addEmpScreen,
        name: RouteNames.addEmpScreen,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: AddEmpDetailsScreen(),
        ),
      ),

      /// edit emp screen
      GoRoute(
        path: "${RouteNames.editEmpScreen}/:empId",
        name: RouteNames.editEmpScreen,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
          context: context,
          state: state,
          child: EditEmpDetailsScreen(
            empId: state.pathParameters['empId'] ?? "",
          ),
        ),
      ),

      /// exception screen
      GoRoute(
        path: RouteNames.errorScreen,
        builder: (BuildContext context, GoRouterState state) {
          return ErrorScreen();
        },
      ),

      /// no Internet screen
      GoRoute(
        path: RouteNames.noInternetScreen,
        builder: (BuildContext context, GoRouterState state) {
          return NoInternetScreen();
        },
      ),
    ],
  );
}
