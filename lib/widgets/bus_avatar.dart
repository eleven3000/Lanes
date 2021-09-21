import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BusAvatar extends StatelessWidget {
  final bool animate;

  const BusAvatar({Key? key, bool this.animate = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 150,
          child:
              Lottie.asset('lib/assets/bus_animated.json', animate: animate)),
    );
  }
}
