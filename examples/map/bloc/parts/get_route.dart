part of '../map_bloc.dart';

extension GetRoute on BlocMaps {
  Future<void> _getRoute(
    _GetRoute event,
    Emitter<StateMaps> emit,
  ) async {
    emit(const StateMaps.loading());
    final response = await repo.getRoute(event.id);

    if (response.error != null) {
      emit(
        StateMaps.error(error: response.error!),
      );
      return;
    }
    emit(
      StateMaps.data(routes: response.data!, isLoading: false),
    );
  }
}
