import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:ybm/core/config.dart';

class LocationPicker extends StatelessWidget {
  final ValueChanged<PickResult> onSelect;
  final LatLng? initialPosition;
  const LocationPicker({
    super.key,
    required this.onSelect,
    this.initialPosition,
  });

  @override
  Widget build(BuildContext context) {
    return PlacePicker(
      apiKey: mapsApiKey,
      onPlacePicked: (result) {
        onSelect.call(result);
        Get.back();
      },
      initialPosition: initialPosition ?? const LatLng(48.876236, 2.3003685),
      useCurrentLocation: true,
      resizeToAvoidBottomInset: false,
    );
  }
}
