import 'package:colos/models/shipments_route.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

List<Polyline> setPolylines(List<ShipmentsRouteEntity>? routes, BuildContext context) {
  final polylines = <Polyline>[];
  for (final item in routes ?? <ShipmentsRouteEntity>[]) {
    final _r = int.parse(item.rGuid!.substring(item.rGuid!.length - 1, item.rGuid!.length));

    polylines.add(
      Polyline(
        polylineId: PolylineId('$_r'),
        points: [
          LatLng(
            item.departureLat ?? 0,
            item.departureLon ?? 0,
          ),
          LatLng(
            item.arrivalLat ?? 0,
            item.arrivalLon ?? 0,
          ),
        ],
        patterns: item.colored == false ? [PatternItem.dash(10), PatternItem.gap(10)] : [],
        width: 3,
        color: Theme.of(context).indicatorColor,
      ),
    );
  }
  return polylines;
}
