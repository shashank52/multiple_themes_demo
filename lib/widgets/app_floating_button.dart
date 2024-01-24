import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../theme/bloc/theme_bloc.dart';

class AppFloatingButton extends StatelessWidget {
  const AppFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
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
    );
  }
}
