import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lanes/models/stop.dart';
import 'package:lanes/models/stop_store_object.dart';
import 'package:lanes/services/stopsService.dart';
import 'package:lanes/style/style.dart';

class StopSearchBox extends StatelessWidget {
  const StopSearchBox(
      {Key? key,
      required this.stopsService,
      required this.width,
      required this.box})
      : super(key: key);

  final StopsService stopsService;
  final double width;
  final Box<StopStoreObject> box;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Stop>(
      mode: Mode.DIALOG,
      //popupShape:
      // RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      isFilteredOnline: true,
      searchDelay: Duration(milliseconds: 500),
      onFind: (text) async {
        if (text == null || text.isEmpty) {
          return box.values
              .map((e) =>
                  Stop.fromJson(jsonDecode(e.stopJson))..isHistory = true)
              .toList();
        }
        return stopsService.getStops(
          text,
          10,
        );
      },
      onChanged: (newValue) {
        if (newValue != null) {
          StopStoreObject? oldStop = box.get(newValue.id);
          if (oldStop == null) {
            box.put(newValue.id, StopStoreObject.fromStop(newValue));
          } else {
            oldStop.uses++;
            box.put(oldStop.id, oldStop);
          }
        }
      },
      itemAsString: (item) => item != null ? item.name : "",
      showSearchBox: true,
      dropdownSearchBaseStyle: largeDarkGrey,
      dialogMaxWidth: width * 0.8,
      dropDownButton: Container(),
      popupItemBuilder: (context, item, isSelected) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(item.getStopTypeIcon()),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: AutoSizeText(
                  item.name,
                  style: largeBlack,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        );
      },
      dropdownBuilder: (context, selectedItem) {
        if (selectedItem != null) {
          return Text(
            selectedItem.name,
            style: largeDarkGrey,
          );
        }
        return Text(
          "Tap to search...",
          style: largeDarkGrey,
        );
      },
      emptyBuilder: (context, searchEntry) {
        String text = "";
        if (searchEntry == null || searchEntry.isEmpty) {
          text = "Search for a stop or address.";
        } else {
          text = "no result found!";
        }
        return Center(
            child: Text(
          text,
          style: largeDarkGrey,
        ));
      },
      dropdownSearchDecoration: InputDecoration.collapsed(
          hintText: "Tap to search...", hintStyle: largeDarkGrey),
    );
  }
}
