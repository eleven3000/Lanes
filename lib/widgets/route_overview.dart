import 'package:flutter/material.dart';
import 'package:lanes/style/style.dart';
import 'package:lanes/widgets/dot_column.dart';

class RouteOverview extends StatelessWidget {
  const RouteOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Departure on:",
                            style: defaultLightGrey,
                          ),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(text: "05", style: headlineDarkGrey),
                            TextSpan(text: "min", style: largeDarkGrey)
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
                                      text: "15 min", style: defaultDarkGrey)
                                ])),
                                Text(
                                  "13:55",
                                  style: defaultBlue,
                                )
                              ],
                            )
                          ],
                        ))
                  ],
                ),
              ),
              Expanded(
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
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(text: "Kray Nord", style: defaultDarkGrey),
                        TextSpan(text: "\n"),
                        TextSpan(text: "Nov 14, 14:00", style: defaultLightGrey)
                      ])),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Berlin, Hauptbahnhof",
                            style: defaultDarkGrey),
                        TextSpan(text: "\n"),
                        TextSpan(text: "Nov 14, 14:00", style: defaultLightGrey)
                      ])),
                    ],
                  ),
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
