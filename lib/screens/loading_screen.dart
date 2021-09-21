import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lanes/style/style.dart';
import 'package:lanes/widgets/bus_avatar.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        color: white,
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SpinKitPulse(
                color: lightGrey,
                size: 300,
              ),
              BusAvatar()
            ],
          ),
        ),
      ),
    );
  }
}
