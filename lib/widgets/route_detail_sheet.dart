import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lanes/models/routeModels.dart';

class RouteDetailSheet extends StatelessWidget {
  RouteDetailSheet({Key? key, required this.routeObj}) : super(key: key);

  late final GoogleMapController mapController;
  final RouteObj routeObj;

  @override
  Widget build(BuildContext context) {
    RoutePoint departurePoint = routeObj.departurePoint;
    RoutePoint arrivalPoint = routeObj.arrivalPoint;

    Marker marker1 = Marker(
        markerId: MarkerId("1"),
        position: LatLng(departurePoint.longitude!, departurePoint.latitude!));
    Marker marker2 = Marker(
        markerId: MarkerId("2"),
        position: LatLng(arrivalPoint.longitude!, arrivalPoint.latitude!));
    final _cameraPosition = CameraPosition(
        target: LatLng(
          (departurePoint.longitude! + arrivalPoint.longitude!) / 2,
          (departurePoint.latitude! + arrivalPoint.latitude!) / 2,
        ),
        zoom: 12);

    print(_cameraPosition);
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(60),
        topRight: Radius.circular(60),
      ),
      child: Container(
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    child: GoogleMap(
                        markers: {marker1, marker2},
                        mapToolbarEnabled: false,
                        zoomGesturesEnabled: false,
                        tiltGesturesEnabled: false,
                        rotateGesturesEnabled: false,
                        scrollGesturesEnabled: false,
                        onMapCreated: (controller) =>
                            mapController = controller,
                        initialCameraPosition: _cameraPosition))),
            Expanded(flex: 4, child: Container())
          ],
        ),
      ),
    );
  }
}
