import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:licencias/styles/global_styles.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class MiniMapsLocation extends StatefulWidget {
  MiniMapsLocation({Key? key}) : super(key: key);

  @override
  State<MiniMapsLocation> createState() => _MiniMapsLocationState();
}

class _MiniMapsLocationState extends State<MiniMapsLocation> {
  late GoogleMapController _controller;

  static CameraPosition initialPosition = CameraPosition(
    target: LatLng(19.313101, -98.883850),
    zoom: 14.0,
  );

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GoogleMap(
        initialCameraPosition: initialPosition,
        markers: markers,
        zoomControlsEnabled: false,
        zoomGesturesEnabled: false,
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
      return Future.error('Servicios de ubicación deshabilitados');
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
        return Future.error('Permisos de ubicación denegados');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Permisos de ubicación denegados permanentemente, no es posible realizar la solicitud.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
