import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lanes/models/routeModels.dart';
import 'package:lanes/style/style.dart';

class SubSectionsColumn extends StatelessWidget {
  final List<RoutePart> parts;
  final int max = 3;

  const SubSectionsColumn({Key? key, required this.parts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      itemCount: min(parts.length, max),
      itemBuilder: (context, index) {
        if (index == 1 && parts.length > max) {
          return SubstectionHiddenIcon(hiddenAmount: parts.length - max + 1);
        }
        return SubsectionIcon(part: parts[index]);
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_forward_ios,
            color: lightGrey,
            size: 12,
          ),
        );
      },
    );
  }
}

class SubsectionIcon extends StatelessWidget {
  final RoutePart part;
  const SubsectionIcon({Key? key, required this.part}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoutePoint departurePoint = part.points[0];
    DateTime departureTime =
        DateTime.fromMillisecondsSinceEpoch(departurePoint.dateTime).toLocal();
    return Container(
      child: Column(
        children: [
          Text(DateFormat("HH:mm").format(departureTime),
              style: defaultLightGrey),
          Row(
            children: [
              Icon(
                Icons.directions_bus,
                color: darkGrey,
              ),
              Container(
                decoration: BoxDecoration(
                  color: lightOrange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 6.0),
                  child: Text(
                    part.mot.shortName,
                    style: defaultWhite,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SubstectionHiddenIcon extends StatelessWidget {
  final int hiddenAmount;

  const SubstectionHiddenIcon({Key? key, required this.hiddenAmount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
          child: Column(
        children: [
          Text("${hiddenAmount}x", style: defaultLightGrey),
          Icon(
            Icons.more_horiz,
            color: darkGrey,
          ),
        ],
      )),
    );
  }
}
