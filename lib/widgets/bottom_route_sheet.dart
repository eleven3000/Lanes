import 'package:flutter/material.dart';
import 'package:lanes/style/style.dart';
import 'package:lanes/widgets/route_overview.dart';

class BottomRouteSheet extends StatelessWidget {
  const BottomRouteSheet({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

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
          padding: const EdgeInsets.symmetric(
              vertical: 60, horizontal: 20),
          child: ListView.separated(
            padding: const EdgeInsets.all(0),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return RouteOverview();
            },
            separatorBuilder:
                (BuildContext context, int index) {
              return SizedBox(
                height: 10,
              );
            },
          ),
        ),
      ),
    );
  }
}
