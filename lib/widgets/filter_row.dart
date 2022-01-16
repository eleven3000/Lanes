import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lanes/models/routeParameters.dart';
import 'package:lanes/style/style.dart';

class FilterColumn extends ConsumerStatefulWidget {
  const FilterColumn({
    Key? key,
  }) : super(key: key);

  @override
  _FilterColumnState createState() => _FilterColumnState();
}

class _FilterColumnState extends ConsumerState<FilterColumn> {
  late List<bool> enabled;
  @override
  void initState() {
    enabled = [true, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    RouteParameters params = ref.read(routeParametersProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Container(
            child: Text("Depart at: " + ((params.departAt != null)? DateFormat("MMM dd, HH:mm")
                                                .format(params.departAt!): "Now"),
                style: enabled[0] ? defaultWhite : defaultLightGrey),
          ),
          onTap: () async {
            var now = DateTime.now();
            var selected = await showDateTimePicker(context: context, initialDate: now, firstDate: now, lastDate: now.add(Duration(days: 31)));
            params.departAt = selected;
            setState(() {
              if(selected!=null){
                params.arriveAt = null;
                enabled[0] = true;
                enabled[1] = false;
            }
            });
          },
        ),
        GestureDetector(
          child: Container(
            child: Text("Arrive at: " + ((params.arriveAt != null)? DateFormat("MMM dd, HH:mm")
                                                .format(params.arriveAt!): "Now"),
                style: enabled[1] ? defaultWhite : defaultLightGrey),
          ),
          onTap: () async {
            var now = DateTime.now();
            var selected = await showDateTimePicker(context: context, initialDate: now, firstDate: now, lastDate: now.add(Duration(days: 31)));
            params.arriveAt = selected;
            setState(() {
              if(selected!=null){
                params.departAt = null;
                enabled[0] = false;
                enabled[1] = true;
              }else{
                enabled[0] = true;
                enabled[1] = false;
              }
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
