import 'package:flutter/material.dart';
import 'package:multiple_themes_demo/widgets/app_floating_button.dart';

import '../../widgets/app_tab_bar.dart';

/// The `MyHomePage` class is a stateful widget that represents the home page of an app and contains a
/// scaffold with a tab bar and a floating action button.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: AppTabBar(),
        floatingActionButton:
            AppFloatingButton() // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
