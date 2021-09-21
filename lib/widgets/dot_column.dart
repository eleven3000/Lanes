import 'package:flutter/material.dart';
import 'package:lanes/style/style.dart';

class DotColumn extends StatelessWidget {
  final double size;
  const DotColumn({
    Key? key,
    this.size = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: size,
          backgroundColor: lightBlue,
          child: CircleAvatar(
            backgroundColor: white,
            radius: size / 2,
            child: CircleAvatar(
              backgroundColor: lightBlue.withOpacity(0.2),
              radius: 6,
            ),
          ),
        ),
        CircleAvatar(
          radius: size / 2,
          backgroundColor: lightGrey,
        ),
        CircleAvatar(
          radius: size / 2,
          backgroundColor: lightGrey,
        ),
        CircleAvatar(
          radius: size / 2,
          backgroundColor: lightGrey,
        ),
        CircleAvatar(
          radius: size,
          backgroundColor: lightOrange,
          child: CircleAvatar(
            backgroundColor: white,
            radius: size / 2,
            child: CircleAvatar(
              backgroundColor: orange.withOpacity(0.2),
              radius: size / 2,
            ),
          ),
        )
      ],
    );
  }
}
