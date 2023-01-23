import 'package:colos/models/app_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'parts/get_current_theme.dart';
part 'parts/switch_theme.dart';
part 'state.dart';
part 'event.dart';

class BlocAppTheme extends Bloc<EventAppTheme, StateAppTheme> {
  BlocAppTheme() : super(StateAppThemeInit()) {
    _init();
    on<EventAppThemeGetCurrent>(_getCurrentTheme);
    on<EventAppThemeSwitchTheme>(_switchTheme);
  }

  late final AppTheme currentTheme;
  final brightness = SchedulerBinding.instance.window.platformBrightness;

  ThemeMode get theme {
    if (state is StateAppThemeData) {
      return (state as StateAppThemeData).themeMode;
    } else {
      return currentTheme == AppTheme.light ? ThemeMode.light : ThemeMode.dark;
    }
  }

  void _init() async {
    final _prefs = await SharedPreferences.getInstance();
    final _currentTheme = _prefs.getString('theme');
    if (_currentTheme == 'light') {
      currentTheme = AppTheme.light;
    } else if (_currentTheme == 'dark') {
      currentTheme = AppTheme.dark;
    } else if (brightness == Brightness.dark) {
      currentTheme = AppTheme.dark;
    } else if (brightness == Brightness.light) {
      currentTheme = AppTheme.light;
    }
  }
}

enum AppTheme {
  dark,
  light,
  unknown,
}
