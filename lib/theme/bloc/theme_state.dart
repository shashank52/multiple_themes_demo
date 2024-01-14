part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  const ThemeState(this.themeData);

  bool get isLightTheme => themeData.brightness == Brightness.light;

  static ThemeState get darkTheme =>
      ThemeState(ThemeData.dark(useMaterial3: true));

  static ThemeState get lightTheme =>
      ThemeState(ThemeData.light(useMaterial3: true));

  @override
  List<Object> get props => [themeData];
}
