import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_themes_demo/widgets/app_tab_bar.dart';

import 'theme/bloc/theme_bloc.dart';

void main() {
  runApp(const MyApp());
}

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
            title: 'Flutter Demo',
            theme: state.themeData,
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const AppTabBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ThemeBloc>(context).add(const ThemeEvent());
        },
        tooltip: 'Switch theme',
        child: BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
          if (state.isLightTheme) {
            return const Icon(Icons.light_mode);
          } else {
            return const Icon(Icons.dark_mode);
          }
        }),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
