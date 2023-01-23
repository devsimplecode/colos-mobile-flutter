import 'package:colos/widgets/google_map_search/src/place_picker.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScreenMapSearch extends StatelessWidget {
  const ScreenMapSearch({
    Key? key,
    required this.onPlaceTap,
  }) : super(key: key);

  final Function(String) onPlaceTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: PlacePicker(
        apiKey: 'YOUR API KEY',
        onPlacePicked: (result) async {
          final _address = await placemarkFromCoordinates(
              result.geometry?.location.lat ?? 0, result.geometry?.location.lng ?? 0,
              localeIdentifier: 'en_US');
          onPlaceTap.call('${_address.first.country ?? ''}, ${_address.first.locality ?? ''}');
          Navigator.of(context).pop();
        },
        initialPosition: const LatLng(0, 0),
        useCurrentLocation: true,
      ),
    );
  }
}
