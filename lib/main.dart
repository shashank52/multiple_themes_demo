import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_themes_demo/constant/routes.dart';

import 'home/ui/home_view.dart';
import 'theme/bloc/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

/// The `MyApp` class is the root of a Flutter application that uses the `BlocProvider` and
/// `BlocBuilder` widgets to manage the theme state and display the home page.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routes.onGenerateRoute,
            title: 'Flutter Demo',
            theme: state.themeData,
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}
