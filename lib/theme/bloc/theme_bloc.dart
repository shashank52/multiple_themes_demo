import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multiple_themes_demo/constant/colors.dart';
import 'package:multiple_themes_demo/settings/data/model/app_color_model.dart';

import '../../settings/data/model/mock_data.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.lightTheme(appColorModel.data[0])) {
    on<ThemeEvent>((event, emit) {
      if (event.switchBrightness) {
        if (state.themeData.brightness == Brightness.light) {
          emit(ThemeState.darkTheme(state.appColor));
        } else {
          emit(ThemeState.lightTheme(state.appColor));
        }
      } else {
        if (state.themeData.brightness == Brightness.light) {
          emit(ThemeState.lightTheme(event.appColor));
        } else {
          emit(ThemeState.darkTheme(event.appColor));
        }
      }
    });
  }
}
