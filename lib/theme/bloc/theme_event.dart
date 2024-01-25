part of 'theme_bloc.dart';

class ThemeEvent extends Equatable {
 ThemeEvent(
      {required this.appColor , this.switchBrightness = false});
  final AppColor appColor;
  final bool switchBrightness;

  @override
  List<Object> get props => [appColor, switchBrightness];
}
