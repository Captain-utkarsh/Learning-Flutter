import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);

  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  late GoogleMapController? mapController;
  final Location _location = Location();

  final LatLng _center = const LatLng(23.1924911, 72.6134243);

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }
  void _onMapCreated(GoogleMapController _gmcontroller) {
    mapController = _gmcontroller;
    _location.onLocationChanged.listen((event) {
      mapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(_center.latitude, _center.longitude), zoom: 15)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
          ),
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
        ),
      ),
    );
  }
}
