part of '../bloc.dart';

extension GetCurrentTheme on BlocAppTheme {
  Future<void> _getCurrentTheme(
    EventAppThemeGetCurrent event,
    Emitter<StateAppTheme> emit,
  ) async {
    final themeMode = currentTheme == AppTheme.dark ? ThemeMode.dark : ThemeMode.light;
    emit(
      StateAppThemeData(themeMode: themeMode),
    );
  }
}
