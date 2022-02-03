import 'package:flutter/material.dart';
import '../NavBarScreens/more.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class UserDetailPage extends StatefulWidget {
  final User user;

  const UserDetailPage({
    required this.user,
  });

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  late GoogleMapController? mapController;
  final Location _location = Location();

  final LatLng _center = const LatLng(45.521563, -122.677433);

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }
  void _onMapCreated(GoogleMapController _gmcontroller) {
    mapController = _gmcontroller;
    _location.onLocationChanged.listen((event) {
      mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(event.latitude!, event.longitude!), zoom: 15)));
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.user.name),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Image.network(
                  widget.user.imageUrl,
                  height: 300,
                  fit: BoxFit.cover,
                ),
                const SizedBox(height: 16),
                Text(
                  widget.user.name,
                  style: const TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                Expanded(
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
