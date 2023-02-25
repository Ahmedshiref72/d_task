
import 'package:flutter/material.dart';

import '../../home/presentation/screens/homescreen.dart';
import '../../opening/presentation/screens/splash_screen.dart';
import 'app_strings.dart';

class Routes {
  static const String home = '/';
  static const String splash = '/splash';
  static const String homeScreen = '/homeScreen';


}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) =>  const SplashScreen(),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) =>  const HomeScreen());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.wrongScreen),
        ),
        body: const Center(child: Text(AppStrings.routeNotFound)),
      ),
    );
  }
}
