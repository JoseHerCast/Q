import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:line_icons/line_icons.dart';

/// `MapScreen` is a `StatefulWidget` that creates a `_MapScreenState` object
class MapScreen extends StatefulWidget {
  MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

/// The _MapScreenState class is a StatefulWidget that returns a GoogleMap widget that takes an
/// initialCameraPosition, a mapType, and an onMapCreated function
class _MapScreenState extends State<MapScreen> {
  late GoogleMapController _controller;

  static CameraPosition initialPosition = CameraPosition(
    target: LatLng(19.313101, -98.883850),
    zoom: 14.0,
  );

  Set<Marker> markers = {};

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
    return Stack(children: [
      GoogleMap(
        initialCameraPosition: initialPosition,
        markers: markers,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
      Container(
        margin: EdgeInsets.only(top: 10),
        child: FloatingActionButton(
          backgroundColor: CustomColors.subBlue,
          mini: true,
          onPressed: () async {
            Position position = await _determinePosition();
            _controller.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 14,
                ),
              ),
            );
            markers.clear();
            markers.add(
              Marker(
                markerId: const MarkerId('currentLocation'),
                position: LatLng(position.latitude, position.longitude),
              ),
            );
            setState(() {});
          },
          child: Icon(
            LineIcons.crosshairs,
            size: 20,
          ),
        ),
      )
    ]);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Servicios de ubicaci??n deshabilitados');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Permisos de ubicaci??n denegados');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Permisos de ubicaci??n denegados permanentemente, no es posible realizar la solicitud.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
