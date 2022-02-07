import 'package:flutter/material.dart';
import 'package:login_signup/screens/widget/heart.dart';
import 'package:login_signup/screens/widget/stagger.dart';

class People extends StatefulWidget {
  const People({Key? key}) : super(key: key);

  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  // late GoogleMapController? mapController;
  // final Location _location = Location();

  // final LatLng _center = const LatLng(23.1924911, 72.6134243);

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }
  // void _onMapCreated(GoogleMapController _gmcontroller) {
  //   mapController = _gmcontroller;
  //   _location.onLocationChanged.listen((event) {
  //     mapController?.animateCamera(CameraUpdate.newCameraPosition(
  //         CameraPosition(
  //             target: LatLng(_center.latitude, _center.longitude), zoom: 15)));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          child: const Text(
            'People Page',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          duration: const Duration(milliseconds: 1300),
          builder: (BuildContext context, double val, childd) {
            return Opacity(
              opacity: val,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: childd,
              ),
            );
          },
        ),
        ListTile(
          trailing: Heart(),
          title: const Text('Like Button'),
        ),
        const Stagger(),
      ],
    )));
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