import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:lanes/models/routeModels.dart';
import 'package:lanes/style/style.dart';

class RouteDetailSheet extends StatelessWidget {
  RouteDetailSheet({Key? key, required this.routeObj}) : super(key: key);

  final RouteObj routeObj;

  @override
  Widget build(BuildContext context) {
    RoutePoint departurePoint = routeObj.departurePoint;
    RoutePoint arrivalPoint = routeObj.arrivalPoint;

    Marker marker1 = Marker(
      color: lightBlue,
      locations: [
        Location(departurePoint.latitude!, departurePoint.longitude!)
      ],
    );
    Marker marker2 = Marker(
      color: lightOrange,
      locations: [Location(arrivalPoint.latitude!, arrivalPoint.longitude!)],
    );

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
                    child: StaticMap(
                  center: Location(
                      (departurePoint.latitude! + arrivalPoint.latitude!) / 2,
                      (departurePoint.longitude! + arrivalPoint.longitude!) /
                          2),
                  markers: [marker1, marker2],
                  paths: routeObj.paths.toList(),
                  googleApiKey: "AIzaSyCJ748fVVSgX_9-n15NoCn3BU5QYdS8lXs",
                ))),
            Expanded(flex: 4, child: Container())
          ],
        ),
      ),
    );
  }
}
