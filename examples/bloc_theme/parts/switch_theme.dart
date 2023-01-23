part of '../bloc.dart';

extension SwitchTheme on BlocAppTheme {
  Future<void> _switchTheme(
    EventAppThemeSwitchTheme event,
    Emitter<StateAppTheme> emit,
  ) async {
    final themeMode = event.theme == AppTheme.dark ? ThemeMode.dark : ThemeMode.light;
    final _prefs = await SharedPreferences.getInstance();
    _prefs.setString('theme', event.theme.name);

    emit(StateAppThemeInit());
    emit(
      StateAppThemeData(themeMode: themeMode),
    );
  }
}
