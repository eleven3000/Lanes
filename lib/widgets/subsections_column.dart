import 'package:flutter/material.dart';
import 'package:lanes/style/style.dart';

class SubSectionsColumn extends StatelessWidget {
  const SubSectionsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SubsectionIcon(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_forward_ios,
            color: lightGrey,
            size: 12,
          ),
        ),
        SubsectionIcon(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.arrow_forward_ios,
            color: lightGrey,
            size: 12,
          ),
        ),
        SubsectionIcon()
      ],
    );
  }
}

class SubsectionIcon extends StatelessWidget {
  const SubsectionIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text("14:00", style: defaultLightGrey),
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
                    "20",
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
