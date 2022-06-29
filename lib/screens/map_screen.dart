import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// `MapScreen` is a `StatefulWidget` that creates a `_MapScreenState` object
class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

/// The _MapScreenState class is a StatefulWidget that returns a GoogleMap widget that takes an
/// initialCameraPosition, a mapType, and an onMapCreated function
class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static CameraPosition initialPosition = CameraPosition(
    target: LatLng(19.313101, -98.883850),
    zoom: 14.0,
  );

  static CameraPosition targetPosition = CameraPosition(
    target: LatLng(19.313101, -98.883850),
    zoom: 14.0,
  );

  /// The build function returns a GoogleMap widget that takes an initialCameraPosition, a mapType, and
  /// an onMapCreated function
  ///
  /// Args:
  ///   context (BuildContext): The context of the widget.
  ///
  /// Returns:
  ///   A GoogleMap widget.
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialPosition,
      mapType: MapType.normal,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
