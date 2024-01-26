import 'package:flutter/material.dart';
import 'package:multiple_themes_demo/home/ui/home_view.dart';
import 'package:multiple_themes_demo/settings/ui/settings_view.dart';

/// The `Routes` class in Dart defines named routes for navigation in a Flutter app and provides a
/// method for generating routes based on the given route settings.
class Routes {
  static const home = '/home';
  static const setting = '/settings';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          settings: settings,
          builder: ((context) => const MyHomePage(title: 'Demo')),
        );

      case setting:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const SettingsView(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: ((context) => const MyHomePage(title: 'Demo')),
        );
    }
  }
}
