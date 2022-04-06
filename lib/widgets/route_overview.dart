import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lanes/models/routeModels.dart';
import 'package:lanes/style/style.dart';
import 'package:lanes/widgets/dot_column.dart';
import 'package:lanes/widgets/route_detail_sheet.dart';
import 'package:lanes/widgets/subsections_column.dart';

class RouteOverview extends StatelessWidget {
  final RouteObj route;

  RouteOverview({required this.route, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoutePoint departurePoint = route.departurePoint;
    DateTime departureTime = route.departureTime;
    //.subtract(Duration(hours: 1));
    RoutePoint arrivalPoint = route.arrivalPoint;
    DateTime arrivalTime = route.arrivalTime;

    double height = MediaQuery.of(context).size.height;
    double width = min(MediaQuery.of(context).size.width, 700);
    return SizedBox(
      height: 200,
      width: double.maxFinite,
      child: Container(
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey[200]!, width: 2)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Departure in:",
                            style: defaultLightGrey,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: departureTime
                                    .difference(
                                        DateTime.now().add(Duration(hours: 2)))
                                    .inMinutes
                                    .toString()
                                    .padLeft(2, "0"),
                                style: headlineDarkGrey),
                            TextSpan(text: " min", style: largeDarkGrey)
                          ]))
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "Travel Time: ",
                                      style: defaultLightGrey),
                                  TextSpan(
                                      text: route.publicDuration,
                                      style: defaultDarkGrey)
                                ])),
                                Text(
                                  DateFormat("HH:mm").format(departureTime),
                                  style: defaultBlue,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Flexible(
                                child: SubSectionsColumn(parts: route.parts))
                          ],
                        ))
                  ],
                ),
              ),
              Flexible(
                  fit: FlexFit.loose,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Row(children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: DotColumn(
                              size: 8,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: RichText(
                                      overflow: TextOverflow.fade,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: departurePoint.name,
                                            style: defaultDarkGrey),
                                        TextSpan(text: "\n"),
                                        TextSpan(
                                            text: DateFormat("MMM dd, HH:mm")
                                                .format(departureTime),
                                            style: defaultLightGrey)
                                      ])),
                                ),
                                Expanded(
                                  child: RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: arrivalPoint.name,
                                        style: defaultDarkGrey),
                                    TextSpan(text: "\n"),
                                    TextSpan(
                                        text: DateFormat("MMM dd, HH:mm")
                                            .format(arrivalTime),
                                        style: defaultLightGrey)
                                  ])),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                      Flexible(
                        child: TextButton(
                          style: orangeButtonRoundedStyle,
                          onPressed: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              constraints: BoxConstraints(
                                  maxHeight: height * 0.9,
                                  maxWidth: width * 0.9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(60),
                                  topRight: Radius.circular(60),
                                ),
                              ),
                              builder: (context) {
                                return RouteDetailSheet(routeObj: route,);
                              },
                            );
                          },
                          child: Text(
                            "Details",
                            style: defaultWhite,
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
