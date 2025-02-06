import 'package:go_router/go_router.dart';

/// usage example: GoRouter.of(context).clearStackAndNavigate('home')
/// this will actually clear the navigation stack till the route you mentioned

extension GoRouterExtension on GoRouter {
  void clearStackAndNavigate(String location) {
    while (canPop()) {
      pop();
    }
    pushReplacement(location);
  }
}
