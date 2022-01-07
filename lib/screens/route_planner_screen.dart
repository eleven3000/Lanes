import 'dart:math';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:lanes/screens/loading_screen.dart';
import 'package:lanes/services/stopsService.dart';
import 'package:lanes/style/style.dart';
import 'package:lanes/widgets/bottom_route_sheet.dart';
import 'package:lanes/widgets/dot_column.dart';
import 'package:lanes/widgets/filter_row.dart';
import 'package:lanes/widgets/stop_search_box.dart';

class RoutePlannerScreen extends StatefulWidget {
  const RoutePlannerScreen({Key? key}) : super(key: key);

  @override
  _RoutePlannerScreenState createState() => _RoutePlannerScreenState();
}

class _RoutePlannerScreenState extends State<RoutePlannerScreen> {
  final Future<String> _initScreen = Future<String>.delayed(
    const Duration(seconds: 2),
    () => 'Data Loaded',
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final chopper = ChopperClient(
      baseUrl: "https://api.lanesapp.de",
      services: [
        StopsService.create()
      ],
    );

    final stopsService = chopper.getService<StopsService>();

    return FutureBuilder(
        future: _initScreen,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoadingScreen();
          }
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Container(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox.expand(
                        child: Container(
                            decoration: BoxDecoration(color: lightOrange),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: FilterColumn(),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: SizedBox(
                                      height: min(200, height / 5),
                                      width: width,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            DotColumn(),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "From",
                                                    style: defaultLightGrey,
                                                  ),
                                                  StopSearchBox(stopsService: stopsService, width: width),
                                                  Divider(
                                                    color: lightGrey,
                                                    thickness: 2,
                                                    endIndent: 20,
                                                  ),
                                                  Text(
                                                    "To",
                                                    style: defaultLightGrey,
                                                  ),
                                                  StopSearchBox(stopsService: stopsService, width: width)
                                                ],
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: lightGrey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Icon(
                                                    Icons.swap_vert_rounded,
                                                    color: darkGrey,
                                                    size: 50,
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: lightBlue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: IconButton(
                                                    padding: EdgeInsets.all(2),
                                                    iconSize: 50,
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_forward_rounded,
                                                      color: white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      BottomRouteSheet(height: height, width: width),
                    ],
                  ),
                ),
              ));
        });
  }
}

