import 'package:flutter/material.dart';
import 'package:oivan_exam/core/dto/user/user_dto.dart';
import 'package:oivan_exam/ui/screens/profile/detail_page.dart';
import 'package:oivan_exam/ui/screens/home/home_screen.dart';
import 'package:oivan_exam/ui/screens/sign_in/sign_in_screen.dart';
import 'package:oivan_exam/ui/screens/splash/splash_screen.dart';

class MyRouter {
  static const String other = '/';
  static const String splash = '/splash';
  static const String home = '/home';
  static const String login = '/login';
  static const String auth = '/auth';
  static const String detail = '/detail';
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
      case detail:
        return _buildRouteNavigationWithoutEffect(
          settings,
          UserDetailPage(
            userDto: settings.arguments as UIUserDto,
          ),
        );
      case splash:
        return _buildRouteNavigationWithoutEffect(
          settings,
          const SplashScreen(),
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
