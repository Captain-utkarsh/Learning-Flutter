import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
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

  // @override
  // void dispose() {
  //   super.dispose();
  //   mapController!.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
        ),
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}
//GoogleMap(
        //   onMapCreated: _onMapCreated,
        //   initialCameraPosition: CameraPosition(
        //     target: _center,
        //   ),
        //   mapType: MapType.normal,
        //   myLocationEnabled: true,
        //   myLocationButtonEnabled: true,
        // ),