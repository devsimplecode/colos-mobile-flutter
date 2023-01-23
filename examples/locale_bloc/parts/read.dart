part of '../bloc_locale.dart';

extension Read on BlocLocale {
  Future<void> _read(
    EventLocaleRead event,
    Emitter<StateBlocLocale> emit,
  ) async {
    final result = repo.read();
    if (result.error != null) {
      emit(
        StateLocaleError(error: result.error!.message),
      );
    } else {
      emit(
        StateLocaleData(
          locale: result.locale ?? defaultLocale,
        ),
      );
    }
  }
}
