import 'dart:developer';
import 'dart:io';

import 'package:colos/constants/app_text_styles.dart';
import 'package:colos/constants/assets.dart';
import 'package:colos/core/router/router.dart';
import 'package:colos/features/map/bloc/map_bloc.dart';
import 'package:colos/features/map/widgets/set_markers.dart';
import 'package:colos/features/map/widgets/set_polylines.dart';
import 'package:colos/widgets/alerts/alerts.dart';
import 'package:colos/widgets/loader/app_loading_indicator.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:colos/widgets/buttons/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'widgets/map_bottom.dart';
part 'widgets/header.dart';

class ScreenMapRoutes extends StatefulWidget {
  const ScreenMapRoutes({
    Key? key,
    required this.guid,
    required this.title,
  }) : super(key: key);

  final String title;
  final String guid;

  @override
  State<ScreenMapRoutes> createState() => _ScreenMapRoutesState();
}

class _ScreenMapRoutesState extends State<ScreenMapRoutes> {
  Set<Polyline> polylines = {};
  Set<Marker> markers = {};
  List<LatLng> points = [];

  late String mapStyle = '';

  @override
  void initState() {
    rootBundle.loadString('assets/map_style.txt').then((string) {
      mapStyle = string;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    BlocProvider.of<BlocMaps>(context).add(
      EventMaps.getRoute(id: widget.guid),
    );
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: BlocConsumer<BlocMaps, StateMaps>(
        listener: (context, state) {
          state.maybeMap(
            orElse: () {},
            error: (error) async {
              await showDialogTryAgain(
                context,
                error.error.message,
                onPressed: () => AppRouter.pop(context),
              );
              AppRouter.pop(context);
            },
            data: (data) async {
              if (data.routes.routes != null ||
                  data.routes.routes!.isNotEmpty) {
                if (Platform.isAndroid) {
                  markers.addAll(
                    await setMarkers(data.routes.routes, data.routes.location),
                  );
                } else {
                  markers.addAll(
                    await setMarkersForIos(
                        data.routes.routes, data.routes.location),
                  );
                }
                polylines.addAll(
                  setPolylines(data.routes.routes, context),
                );
              }
            },
          );
        },
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => const SizedBox.shrink(),
            loading: (_) => Center(
              child: AppLoadingIndicator(
                indicatorColor: theme.indicatorColor,
              ),
            ),
            data: (_data) {
              log(_data.routes.routes.toString());
              return Stack(
                children: [
                  GoogleMap(
                    tiltGesturesEnabled: true,
                    compassEnabled: false,
                    zoomControlsEnabled: false,
                    zoomGesturesEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: _countMiddlePoint(
                        LatLng(
                          double.parse(_data.routes.location != null
                              ? _data.routes.location?.lat ?? '0'
                              : '0'),
                          double.parse(_data.routes.location != null
                              ? _data.routes.location?.lon ?? '0'
                              : '0'),
                        ),
                        LatLng(
                          _data.routes.routes != null &&
                                  _data.routes.routes!.isNotEmpty
                              ? _data.routes.routes?.first.departureLat ?? 0
                              : 0,
                          _data.routes.routes != null &&
                                  _data.routes.routes!.isNotEmpty
                              ? _data.routes.routes?.first.departureLon ?? 0
                              : 0,
                        ),
                      ),
                    ),
                    polylines: polylines,
                    markers: markers,
                    onMapCreated: (controller) {
                      controller.setMapStyle(mapStyle);
                      controller.animateCamera(
                        CameraUpdate.newLatLngZoom(
                          _countMiddlePoint(
                            LatLng(
                              _data.routes.routes != null &&
                                      _data.routes.routes!.isNotEmpty
                                  ? _data.routes.routes?.first.arrivalLat ?? 0
                                  : 0,
                              _data.routes.routes != null &&
                                      _data.routes.routes!.isNotEmpty
                                  ? _data.routes.routes?.first.arrivalLon ?? 0
                                  : 0,
                            ),
                            LatLng(
                              _data.routes.routes != null &&
                                      _data.routes.routes!.isNotEmpty
                                  ? _data.routes.routes?.first.departureLat ?? 0
                                  : 0,
                              _data.routes.routes != null &&
                                      _data.routes.routes!.isNotEmpty
                                  ? _data.routes.routes?.first.departureLon ?? 0
                                  : 0,
                            ),
                          ),
                          MediaQuery.of(context).size.aspectRatio * 7.3,
                        ),
                      );
                      controller.dispose();
                    },
                  ),
                  MapBottomWidget(
                    data: _data.routes,
                  ),
                  _MapHeader(
                    shipment: widget.title,
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

LatLng _countMiddlePoint(LatLng point1, LatLng point2) {
  final firstPoin = (point1.latitude + point2.latitude) / 2;
  final secondPoint = (point1.longitude + point2.longitude) / 2;
  return LatLng(firstPoin, secondPoint);
}
