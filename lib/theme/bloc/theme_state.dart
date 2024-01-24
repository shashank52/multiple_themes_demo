part of 'theme_bloc.dart';

class ThemeState extends Equatable {
  final ThemeData themeData;
  static final seedColor;
  const ThemeState(this.themeData);

  bool get isLightTheme => themeData.brightness == Brightness.light;
  static ThemeState get darkTheme => ThemeState(
        FlexThemeData.dark(
          // scheme: scheme,
          colorScheme: ColorScheme.fromSeed(
              seedColor: seedColor, brightness: Brightness.dark),
          // Use very subtly themed app bar elevation in light mode.
          appBarElevation: 0.5,
          useMaterial3: true,
          // We use the nicer Material-3 Typography in both M2 and M3 mode.
          typography: Typography.material2021(
              platform: defaultTargetPlatform,
              colorScheme: const ColorScheme.dark()),
        ),
      );

  static ThemeState get lightTheme => ThemeState(FlexThemeData.light(
      // scheme: scheme,
      // Use very subtly themed app bar elevation in light mode.
      colorScheme: ColorScheme.fromSeed(
          seedColor: seedColor, brightness: Brightness.light),
      appBarElevation: 2,
      useMaterial3: true,
      // We use the nicer Material-3 Typography in both M2 and M3 mode.
      typography: Typography.material2021(
        platform: defaultTargetPlatform,
      )));
  

  @override
  List<Object> get props => [themeData, seedColor];
}
