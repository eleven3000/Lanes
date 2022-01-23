import 'package:flutter/material.dart';
import 'package:lanes/style/style.dart';

class ChipSelector extends StatefulWidget {
  const ChipSelector({Key? key}) : super(key: key);

  @override
  _ChipSelectorState createState() => _ChipSelectorState();
}

class _ChipSelectorState extends State<ChipSelector> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        FilterChip(
          label: Text(
            "Bus",
            style: largeDarkGrey,
          ),
          backgroundColor: lightGrey,
          selectedColor: lightBlue,
          labelPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
          onSelected: (value) {},
        ),
        FilterChip(
          label: Text(
            "Bus",
            style: largeDarkGrey,
          ),
          backgroundColor: lightGrey,
          selectedColor: lightBlue,
          labelPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
          onSelected: (value) {},
        ),
        FilterChip(
          label: Text(
            "Bus",
            style: largeDarkGrey,
          ),
          backgroundColor: lightGrey,
          selectedColor: lightBlue,
          labelPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
          onSelected: (value) {},
        ),
        FilterChip(
          label: Text(
            "Bus",
            style: largeDarkGrey,
          ),
          backgroundColor: lightGrey,
          selectedColor: lightBlue,
          labelPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
          onSelected: (value) {},
        ),
        FilterChip(
          label: Text(
            "Bus",
            style: largeDarkGrey,
          ),
          backgroundColor: lightGrey,
          selectedColor: lightBlue,
          labelPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
          onSelected: (value) {},
        ),
        FilterChip(
          label: Text(
            "Bus",
            style: largeDarkGrey,
          ),
          backgroundColor: lightGrey,
          selectedColor: lightBlue,
          labelPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
          onSelected: (value) {},
        ),
      ],
    );
  }
}
