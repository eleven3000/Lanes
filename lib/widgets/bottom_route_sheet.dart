import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lanes/models/routeModels.dart';
import 'package:lanes/style/style.dart';
import 'package:lanes/widgets/route_overview.dart';

import 'bus_avatar.dart';

class BottomRouteSheet extends StatelessWidget {
  const BottomRouteSheet(
      {Key? key,
      required this.height,
      required this.width,
      required this.currentRoutes,
      required this.showLoading})
      : super(key: key);

  final double height;
  final double width;
  final RouteResponse? currentRoutes;
  final bool showLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * (3 / 5),
      width: width,
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(60),
            topRight: Radius.circular(60),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: (!showLoading)
              ? (currentRoutes != null)
                  ? ListView.separated(
                      padding: const EdgeInsets.all(0),
                      itemCount: currentRoutes!.routes.length,
                      itemBuilder: (BuildContext context, int index) {
                        return RouteOverview(
                          route: currentRoutes!.routes[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                    )
                  : Center(
                      child: Text(
                      "Start by searching for two stops!",
                      style: largeDarkGrey,
                    ))
              : Center(
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      SpinKitSpinningLines(
                        color: lightGrey,
                        size: 200,
                      ),
                      BusAvatar()
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
