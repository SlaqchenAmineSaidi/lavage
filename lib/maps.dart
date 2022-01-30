import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_laravel/services/adresse.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => MapScreenState();
}

var adresses = Adre.adresses;

GoogleMapController mapController;

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  var location = new Location();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(double.parse(adresses[0]['adress2']),
        double.parse(adresses[0]['adress1'])),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(double.parse(adresses[0]['adress2']),
          double.parse(adresses[0]['adress1'])),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: const Text('Maps'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          mapController = controller;
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
