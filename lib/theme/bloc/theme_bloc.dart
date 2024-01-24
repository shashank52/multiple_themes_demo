import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multiple_themes_demo/constant/colors.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.lightTheme) {
    on<ThemeEvent>((event, emit) {
      if (state.themeData.brightness == Brightness.light) {
        emit(ThemeState.darkTheme);
      } else {
        emit(ThemeState.lightTheme);
      }
    });
  }
}
