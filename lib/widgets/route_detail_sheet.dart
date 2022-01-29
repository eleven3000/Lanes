import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:intl/intl.dart';
import 'package:lanes/models/routeModels.dart';
import 'package:lanes/style/style.dart';
import 'package:lanes/widgets/dot_column.dart';

class RouteDetailSheet extends StatelessWidget {
  RouteDetailSheet({Key? key, required this.routeObj}) : super(key: key);

  final RouteObj routeObj;

  Iterable<Widget> get _partsWidgets sync* {
    for (int i = 0; i < routeObj.partsLength; i++) {
      final part = routeObj.parts[i];
      yield PartWidget(
        part: part,
        isFirst: i == 0,
        isLast: i == routeObj.partsLength - 1,
      );
      if (i != routeObj.partsLength - 1)
        yield SizedBox(
          height: 25,
        );
    }
  }

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
            Expanded(
                flex: 4,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      children: _partsWidgets.toList(),
                    )))
          ],
        ),
      ),
    );
  }
}

class PartWidget extends StatefulWidget {
  PartWidget(
      {Key? key,
      required this.part,
      required this.isFirst,
      required this.isLast})
      : departurePoint = part.departurePoint,
        arrivalPoint = part.arrivalPoint,
        mot = part.mot,
        super(key: key);

  final RoutePart part;
  final RoutePoint departurePoint;
  final RoutePoint arrivalPoint;
  final MeansOfTransportation mot;
  final bool isFirst;
  final bool isLast;

  @override
  State<PartWidget> createState() => _PartWidgetState();
}

class _PartWidgetState extends State<PartWidget> {
  var _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey[200]!, width: 2)),
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
                  height: _isExpanded
                      ? (180 + widget.part.stopovers.length * 25)
                      : 180,
                  child: DotColumn())),
          Expanded(
            flex: 9,
            child: Column(
              children: [
                ListTile(
                  leading: Text(
                    DateFormat("HH:mm").format(widget.part.departureTime),
                    style: veryLargeDarkGrey,
                  ),
                  title: AutoSizeText(widget.departurePoint.name,
                      style: largeDarkGrey, maxLines: 1),
                  subtitle: AutoSizeText(
                      "${widget.mot.name} to ${widget.mot.destination} on Platform ${widget.departurePoint.platform}",
                      style: defaultLightGrey,
                      maxLines: 2),
                  trailing: (widget.isFirst)
                      ? Icon(Icons.home)
                      : Icon(Icons.arrow_upward),
                ),
                ExpansionTile(
                  title: Text(
                    "Zwischenstopps",
                    style: largeDarkGrey,
                    textAlign: TextAlign.center,
                  ),
                  children: widget.part.stopovers
                      .map((e) => Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              e.name,
                              style: defaultDarkGrey,
                              textAlign: TextAlign.center,
                            ),
                          ))
                      .toList(),
                  onExpansionChanged: (value) => setState(() {
                    _isExpanded = value;
                  }),
                  collapsedIconColor: darkGrey,
                  iconColor: darkGrey,
                  collapsedTextColor: darkGrey,
                  textColor: darkGrey,
                ),
                ListTile(
                  leading: Text(
                    DateFormat("HH:mm").format(widget.part.arrivalTime),
                    style: veryLargeDarkGrey,
                  ),
                  title: AutoSizeText(widget.arrivalPoint.name,
                      style: largeDarkGrey, maxLines: 1),
                  subtitle: AutoSizeText(
                      "Arriving on Platform ${widget.arrivalPoint.platform}",
                      style: defaultLightGrey,
                      maxLines: 2),
                  trailing: (widget.isLast)
                      ? Icon(Icons.flag)
                      : Icon(Icons.arrow_downward),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
