import 'dart:math';
import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lanes/models/routeModels.dart';
import 'package:lanes/models/routeParameters.dart';
import 'package:lanes/models/stop.dart';
import 'package:lanes/models/stop_store_object.dart';
import 'package:lanes/screens/loading_screen.dart';
import 'package:lanes/services/stopsService.dart';
import 'package:lanes/services/tripsService.dart';
import 'package:lanes/style/style.dart';
import 'package:lanes/util/error_handler.dart';
import 'package:lanes/widgets/bottom_route_sheet.dart';
import 'package:lanes/widgets/dot_column.dart';
import 'package:lanes/widgets/filter_row.dart';
import 'package:lanes/widgets/stop_search_box.dart';

class RoutePlannerScreen extends ConsumerStatefulWidget {
  const RoutePlannerScreen({Key? key}) : super(key: key);

  @override
  _RoutePlannerScreenState createState() => _RoutePlannerScreenState();
}

class _RoutePlannerScreenState extends ConsumerState<RoutePlannerScreen> {
  final Future<String> _fakeLoadingTime =
      Future<String>.delayed(const Duration(seconds: 2), () => "Data loaded!");

  late Box<StopStoreObject> box;
  Future<void> _init() async {
    box = Hive.box('recent');
    return;
  }

  bool showLoading = false;
  RouteResponse? currentRoutes;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = min(MediaQuery.of(context).size.width, 700);

    final chopper = ChopperClient(
      baseUrl: "https://api.lanesapp.de",
      services: [StopsService.create(), TripsService.create()],
    );

    final stopsService = chopper.getService<StopsService>();
    final tripsService = chopper.getService<TripsService>();
    return FutureBuilder(
        future: Future.wait([_init(), _fakeLoadingTime]),
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
                                    child: SizedBox(
                                        width: width, child: FilterColumn()),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: SizedBox(
                                      height: 180,
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
                                                  StopSearchBox(
                                                    stopsService: stopsService,
                                                    width: width,
                                                    box: box,
                                                    searchType: SearchType.FROM,
                                                  ),
                                                  Divider(
                                                    color: lightGrey,
                                                    thickness: 2,
                                                    endIndent: 20,
                                                  ),
                                                  Text(
                                                    "To",
                                                    style: defaultLightGrey,
                                                  ),
                                                  StopSearchBox(
                                                    stopsService: stopsService,
                                                    width: width,
                                                    box: box,
                                                    searchType: SearchType.TO,
                                                  )
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
                                                  child: IconButton(
                                                    padding: EdgeInsets.all(2),
                                                    iconSize: 50,
                                                    onPressed: () {
                                                      setState(() {
                                                        Stop? oldFrom = ref
                                                            .read(
                                                                routeParametersProvider)
                                                            .from;
                                                        Stop? oldTo = ref
                                                            .read(
                                                                routeParametersProvider)
                                                            .to;
                                                        if (oldTo != null &&
                                                            oldFrom != null) {
                                                          ref
                                                              .read(
                                                                  routeParametersProvider)
                                                              .from = oldTo;
                                                          ref
                                                              .read(
                                                                  routeParametersProvider)
                                                              .to = oldFrom;
                                                        } else {
                                                          MyErrorHandler.showInfo(
                                                              context,
                                                              "Fill in both From and To to switch them");
                                                        }
                                                      });
                                                    },
                                                    icon: Icon(
                                                      Icons.swap_vert_rounded,
                                                      color: darkGrey,
                                                    ),
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
                                                    onPressed: () {
                                                      setState(() {
                                                        showLoading = true;
                                                      });
                                                      var response =
                                                          tripsService.getTrips(
                                                              parameters: ref.read(
                                                                  routeParametersProvider));
                                                      response.then((value) {
                                                        print(value);
                                                        setState(() {
                                                          showLoading = false;
                                                          currentRoutes = value;
                                                        });
                                                      }, onError: (error) {
                                                        setState(() {
                                                          if (error
                                                              is MyMessage) {
                                                            showLoading = false;
                                                            MyErrorHandler
                                                                .showMessage(
                                                                    context,
                                                                    error);
                                                          }
                                                        });
                                                      });
                                                    },
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
                      BottomRouteSheet(
                        height: height,
                        width: width,
                        currentRoutes: currentRoutes,
                        showLoading: showLoading,
                        onRoutesChanged: (oldRoutes) async {
                          setState(() {
                            showLoading = true;
                          });
                          var response = tripsService.getLaterTrips(
                              sessionId: currentRoutes!.sessionID);
                          response.then((value) {
                            setState(() {
                              currentRoutes = value;
                              showLoading = false;
                            });
                          }, onError: (error) {
                            setState(() {
                              showLoading = false;
                              if (error is MyMessage) {
                                showLoading = false;
                                MyErrorHandler.showMessage(context, error);
                              }
                            });
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
