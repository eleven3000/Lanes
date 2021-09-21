import 'package:flutter/material.dart';
import 'package:lanes/style/style.dart';

class FilterColumn extends StatefulWidget {
  const FilterColumn({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterColumn> createState() => _FilterColumnState();
}

class _FilterColumnState extends State<FilterColumn> {
  late List<bool> enabled;
  @override
  void initState() {
    enabled = [true, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Container(
            child: Text("Depart at: Now",
                style: enabled[0] ? defaultWhite : defaultLightGrey),
          ),
          onTap: () {
            setState(() {
              enabled[0] = true;
              enabled[1] = false;
            });
          },
        ),
        GestureDetector(
          child: Container(
            child: Text("Arrive at: Now",
                style: enabled[1] ? defaultWhite : defaultLightGrey),
          ),
          onTap: () {
            setState(() {
              enabled[0] = false;
              enabled[1] = true;
            });
          },
        ),
        GestureDetector(
          child: Row(
            children: [
              Text("Filters",
                  style: enabled[2] ? defaultWhite : defaultLightGrey),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.settings_sharp,
                color: enabled[2] ? white : lightGrey,
              )
            ],
          ),
          onTap: () {
            setState(() {
              enabled[2] = !enabled[2];
            });
          },
        )
      ],
    );
  }
}
