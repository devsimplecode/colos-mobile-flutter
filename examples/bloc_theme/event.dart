part of 'bloc.dart';

abstract class EventAppTheme {}

class EventAppThemeGetCurrent extends EventAppTheme {}

class EventAppThemeSwitchTheme extends EventAppTheme {
  EventAppThemeSwitchTheme({
    required this.theme,
  });

  final AppTheme theme;
}
