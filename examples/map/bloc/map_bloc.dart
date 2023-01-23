import 'package:colos/models/app_error.dart';
import 'package:colos/models/shipments_route.dart';
import 'package:colos/repo/api/maps/base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_bloc.freezed.dart';
part 'parts/get_route.dart';

class BlocMaps extends Bloc<EventMaps, StateMaps> {
  BlocMaps({
    required this.repo,
  }) : super(const StateMaps.init()) {
    on<_GetRoute>(_getRoute);
  }

  final BaseRepoMaps repo;
}

@freezed
class EventMaps with _$EventMaps {
  const factory EventMaps.getRoute({required String id}) = _GetRoute;
}

@freezed
class StateMaps with _$StateMaps {
  const factory StateMaps.init() = _Init;
  const factory StateMaps.error({
    required AppError error,
  }) = _Error;
  const factory StateMaps.loading() = _Loading;
  const factory StateMaps.data({
    required bool isLoading,
    required ShipmentsRouteWithLocationEntity routes,
  }) = _Data;
}
