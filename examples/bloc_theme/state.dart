part of 'bloc.dart';

abstract class StateAppTheme {}

class StateAppThemeInit extends StateAppTheme {}

class StateAppThemeData extends StateAppTheme {
  StateAppThemeData({
    required this.themeMode,
  });

  final ThemeMode themeMode;

  @override
  String toString() => 'StateAppThemeData(themeMode: $themeMode)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StateAppThemeData && other.themeMode == themeMode;
  }

  @override
  int get hashCode => themeMode.hashCode;
}

class StateAppThemeError extends StateAppTheme {
  StateAppThemeError({required this.error});

  final AppError error;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StateAppThemeError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => 'StateLocaleError(error: $error)';
}
