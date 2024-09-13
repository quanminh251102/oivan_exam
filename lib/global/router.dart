import 'package:flutter/material.dart';
import 'package:oivan_exam/ui/screens/home/home_screen.dart';
import 'package:oivan_exam/ui/screens/sign_in/sign_in_screen.dart';

class MyRouter {
  static const String other = '/';
  static const String splash = '/splash';
  static const String home = '/home';
  static const String login = '/login';

  static PageRouteBuilder _buildRouteNavigationWithoutEffect(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      transitionDuration: Duration.zero,
      settings: settings,
    );
  }

  static PageRouteBuilder _buildRouteNavigation(
      RouteSettings settings, Widget widget) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => widget,
      settings: settings,
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SignInScreen(),
        );
      case home:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const HomeScreen(),
        );

      default:
        return _buildRouteNavigationWithoutEffect(
          settings,
          Scaffold(
            body: Center(
              child: Text('No route found: ${settings.name}.'),
            ),
          ),
        );
    }
  }
}
