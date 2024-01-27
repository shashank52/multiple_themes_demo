# multiple_themes_demo

Create a new Flutter project to demonstrate how to achieve multiple theme switching using the BLoC state management.

![](https://github.com/shashank52/multiple_themes_demo/assets/28962601/ed1b6596-5ce5-4e85-a27c-41face4de64a)


## Explanation

In order to achieve multiple themes will create a ThemeBloc and wrap Material App with it.
```
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
```

Now, **ThemeBloc** events and state will have 2 properties to control brightness and color of the app

```
class ThemeEvent extends Equatable {
 const ThemeEvent(
      {required this.appColor , this.switchBrightness = false});
  final AppColor appColor;
  final bool switchBrightness;

  @override
  List<Object> get props => [appColor, switchBrightness];
}


class ThemeState extends Equatable {
  final ThemeData themeData;
  final AppColor appColor;
  const ThemeState(this.themeData, {required this.appColor});

  bool get isLightTheme => themeData.brightness == Brightness.light;
  static ThemeState darkTheme(AppColor appColor) => ThemeState(
      FlexThemeData.dark(
        // scheme: scheme,
        colorScheme: ColorScheme.fromSeed(
            seedColor: appColor.colorCode.materialColor,
            brightness: Brightness.dark),
        // Use very subtly themed app bar elevation in light mode.
        appBarElevation: 0.5,
        useMaterial3: true,
        // We use the nicer Material-3 Typography in both M2 and M3 mode.
        typography: Typography.material2021(
            platform: defaultTargetPlatform,
            colorScheme: const ColorScheme.dark()),
      ),
      appColor: appColor);

  static ThemeState lightTheme(AppColor appColor) => ThemeState(
      FlexThemeData.light(
          // scheme: scheme,
          // Use very subtly themed app bar elevation in light mode.
          colorScheme: ColorScheme.fromSeed(
              seedColor: appColor.colorCode.materialColor,
              brightness: Brightness.light),
          appBarElevation: 2,
          useMaterial3: true,
          // We use the nicer Material-3 Typography in both M2 and M3 mode.
          typography: Typography.material2021(
            platform: defaultTargetPlatform,
          )),
      appColor: appColor);

  @override
  List<Object> get props => [themeData, appColor];
}
```
**ThemeState** is always returning a **ThemeData** object. A third party package [flex_color_scheme](https://pub.dev/packages/flex_color_scheme) is used to return ThemeData obect.

**ThemeState** has an object **AppColor** which is used to control various colors scheme. When event is triggered with an appColor instance its color code is used as **seed color** to generate the ThemeData

*Code Snippet of AppColor model*
```
class AppColor {
  final String colorName;
  final ColorCode colorCode;

  AppColor({
    required this.colorName,
    required this.colorCode,
  });

  AppColor copyWith({
    String? colorName,
    ColorCode? colorCode,
  }) =>
      AppColor(
        colorName: colorName ?? this.colorName,
        colorCode: colorCode ?? this.colorCode,
      );

  factory AppColor.fromMap(Map<String, dynamic> json) => AppColor(
        colorName: json["color_name"],
        colorCode: ColorCode.fromMap(json["color_code"]),
      );

  Map<String, dynamic> toMap() => {
        "color_name": colorName,
        "color_code": colorCode.toMap(),
      };
}

class ColorCode {
  final String type;
  final String value;

  ColorCode({
    required this.type,
    required this.value,
  });

  Color get materialColor =>  Color(int.parse(value.replaceAll('#', '0xFF')));

  ColorCode copyWith({
    String? type,
    String? value,
  }) =>
      ColorCode(
        type: type ?? this.type,
        value: value ?? this.value,
      );

  factory ColorCode.fromMap(Map<String, dynamic> json) => ColorCode(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "type": type,
        "value": value,
      };
}
```
**ThemeBloc** will contain the business logic to either switch brightness or change app theme

```
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
```

**FloatingButton** is used to switch the brightness of the app

```
class AppFloatingButton extends StatelessWidget {
  const AppFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        BlocProvider.of<ThemeBloc>(context).add(ThemeEvent(
            switchBrightness: true, appColor: appColorModel.data[0]));
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
```

Under Settings screen used a `GridView.builder` to generate a list of different color options with the help of `AppColor` model instance.

```
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Center(
                child: Text(
              'Select Color',
              style: Theme.of(context).textTheme.bodyLarge,
            )),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 8,
                    childAspectRatio: width > height
                        ? (width / height) * 2
                        : (height / width) * 2),
                itemCount: appColorModel.data.length,
                itemBuilder: ((context, index) {
                  return BlocBuilder<ThemeBloc, ThemeState>(
                    builder: (context, state) {
                      return Theme(
                        data: ThemeData(
                            brightness: state.isLightTheme
                                ? Brightness.light
                                : Brightness.dark,
                            colorSchemeSeed: appColorModel
                                .data[index].colorCode.materialColor),
                        child: state.appColor == appColorModel.data[index]
                            ? _selectedButton(
                                context, appColorModel.data[index])
                            : _rejectedButton(
                                context, appColorModel.data[index]),
                      );
                    },
                  );
                })),
          )
        ]),
      ),
      floatingActionButton: const AppFloatingButton(),
    );
  }

  Widget _selectedButton(BuildContext context, AppColor appColor) {
    return FilledButton(
        style: const ButtonStyle(),
        onPressed: () => BlocProvider.of<ThemeBloc>(context)
            .add(ThemeEvent(appColor: appColor)),
        child: Text(appColor.colorName));
  }

  Widget _rejectedButton(BuildContext context, AppColor appColor) {
    return FilledButton.tonalIcon(
        icon: Icon(
          Icons.circle,
          size: 16,
          fill: 1,
          color: appColor.colorCode.materialColor,
        ),
        style: const ButtonStyle(),
        onPressed: () => BlocProvider.of<ThemeBloc>(context)
            .add(ThemeEvent(appColor: appColor)),
        label: Text(appColor.colorName));
  }
}
```

I hope this comprehensive guide helps you create a custom theme for your Flutter application. Thanks for reading! 😊
