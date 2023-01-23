import 'dart:io';

import 'package:colos/constants/assets.dart';
import 'package:colos/models/shipments_route.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<List<Marker>> setMarkers(List<ShipmentsRouteEntity>? routes, LocationEntity? location) async {
  final markers = <Marker>[];
  for (final item in routes ?? <ShipmentsRouteEntity>[]) {
    var _startIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), AppAssets.images.mapStartedx3);
    markers.add(
      Marker(
        zIndex: 100,
        icon: _startIcon,
        anchor: const Offset(0.5, 0.5),
        markerId: MarkerId(item.guid ?? ''),
        position: LatLng(
          routes?[0].departureLat ?? 0,
          routes?[0].departureLon ?? 0,
        ),
      ),
    );

    if (item.colored == true) {
      var _icon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), AppAssets.images.mapPasteX4);
      markers.add(
        Marker(
          icon: _icon,
          anchor: const Offset(0.5, 0.5),
          markerId: MarkerId(item.guid ?? ''),
          position: LatLng(
            item.departureLat ?? 0,
            item.departureLon ?? 0,
          ),
        ),
      );
      markers.add(
        Marker(
          icon: _icon,
          anchor: const Offset(0.5, 0.5),
          markerId: MarkerId(item.guid ?? ''),
          position: LatLng(
            item.arrivalLat ?? 0,
            item.arrivalLon ?? 0,
          ),
        ),
      );
    } else {
      var _icon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), AppAssets.images.mapNextX3);
      markers.add(
        Marker(
          icon: _icon,
          anchor: const Offset(0.5, 0.5),
          markerId: MarkerId(item.guid ?? ''),
          position: LatLng(
            item.departureLat ?? 0,
            item.departureLon ?? 0,
          ),
        ),
      );
      markers.add(
        Marker(
          icon: _icon,
          anchor: const Offset(0.5, 0.5),
          markerId: MarkerId(item.guid ?? ''),
          position: LatLng(
            item.arrivalLat ?? 0,
            item.arrivalLon ?? 0,
          ),
        ),
      );
    }
  }
  if (Platform.isIOS) {
    var _icon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      AppAssets.images.mapCurrentx075,
    );

    if (routes?.firstWhereOrNull((element) => element.arrivalLat == double.parse(location?.lat ?? '0')) == null) {
      markers.add(
        Marker(
          zIndex: 1000,
          icon: _icon,
          anchor: const Offset(0.5, 0.5),
          markerId: MarkerId(routes!.last.guid ?? ''),
          position: LatLng(
            routes.first.arrivalLat ?? 0,
            routes.first.arrivalLon ?? 0,
          ),
        ),
      );
    } else {
      markers.add(
        Marker(
          icon: _icon,
          anchor: const Offset(0.5, 0.5),
          markerId: MarkerId(routes?.last.guid ?? ''),
          position: LatLng(
            double.parse(location?.lat ?? '0'),
            double.parse(location?.lon ?? '0'),
          ),
        ),
      );
    }
  } else {
    var _icon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), AppAssets.images.mapCurrentX2);

    if (routes?.firstWhereOrNull((element) => element.arrivalLat == double.parse(location?.lat ?? '0')) == null) {
      markers.add(
        Marker(
          zIndex: 1000,
          icon: _icon,
          anchor: const Offset(0.5, 0.5),
          markerId: MarkerId(routes!.last.guid ?? ''),
          position: LatLng(
            routes.first.arrivalLat ?? 0,
            routes.first.arrivalLon ?? 0,
          ),
        ),
      );
    } else {
      markers.add(
        Marker(
          icon: _icon,
          anchor: const Offset(0.5, 0.5),
          markerId: MarkerId(routes!.last.guid ?? ''),
          position: LatLng(
            double.parse(location?.lat ?? '0'),
            double.parse(location?.lon ?? '0'),
          ),
        ),
      );
    }
  }
  return markers;
}

Future<List<Marker>> setMarkersForIos(List<ShipmentsRouteEntity>? routes, LocationEntity? location) async {
  final markers = <Marker>[];
  for (final item in routes ?? <ShipmentsRouteEntity>[]) {
    var _startIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), AppAssets.images.mapStarted);
    markers.add(
      Marker(
        zIndex: 100,
        icon: _startIcon,
        anchor: const Offset(0.5, 0.5),
        markerId: MarkerId(item.guid ?? ''),
        position: LatLng(
          routes?[0].departureLat ?? 0,
          routes?[0].departureLon ?? 0,
        ),
      ),
    );

    if (item.colored == true) {
      var _icon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), AppAssets.images.mapPaste);
      markers.add(
        Marker(
          icon: _icon,
          anchor: const Offset(0.5, 0.5),
          markerId: MarkerId(item.guid ?? ''),
          position: LatLng(
            item.departureLat ?? 0,
            item.departureLon ?? 0,
          ),
        ),
      );
      markers.add(
        Marker(
          icon: _icon,
          anchor: const Offset(0.5, 0.5),
          markerId: MarkerId(item.guid ?? ''),
          position: LatLng(
            item.arrivalLat ?? 0,
            item.arrivalLon ?? 0,
          ),
        ),
      );
    } else {
      var _icon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), AppAssets.images.mapNext);
      markers.add(
        Marker(
          icon: _icon,
          anchor: const Offset(0.5, 0.5),
          markerId: MarkerId(item.guid ?? ''),
          position: LatLng(
            item.departureLat ?? 0,
            item.departureLon ?? 0,
          ),
        ),
      );
      markers.add(
        Marker(
          icon: _icon,
          anchor: const Offset(0.5, 0.5),
          markerId: MarkerId(item.guid ?? ''),
          position: LatLng(
            item.arrivalLat ?? 0,
            item.arrivalLon ?? 0,
          ),
        ),
      );
    }
  }
  var _icon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), AppAssets.images.mapCurrentx075);
  if (routes?.firstWhereOrNull((element) => element.arrivalLat == double.parse(location?.lat ?? '0')) == null) {
    markers.add(
      Marker(
        zIndex: 1000,
        icon: _icon,
        anchor: const Offset(0.5, 0.5),
        markerId: MarkerId(routes!.last.guid ?? ''),
        position: LatLng(
          routes.first.arrivalLat ?? 0,
          routes.first.arrivalLon ?? 0,
        ),
      ),
    );
  } else {
    markers.add(
      Marker(
        icon: _icon,
        anchor: const Offset(0.5, 0.5),
        markerId: MarkerId(routes!.last.guid ?? ''),
        position: LatLng(
          double.parse(location?.lat ?? '0'),
          double.parse(location?.lon ?? '0'),
        ),
      ),
    );
  }

  return markers;
}
