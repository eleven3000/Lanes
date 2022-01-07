import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:lanes/models/stop.dart';
import 'package:lanes/services/stopsService.dart';
import 'package:lanes/style/style.dart';

class StopSearchBox extends StatelessWidget {
  const StopSearchBox({
    Key? key,
    required this.stopsService,
    required this.width,
  }) : super(key: key);

  final StopsService stopsService;
  final double width;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<Stop>(
      mode: Mode.DIALOG,
      isFilteredOnline: true,
      searchDelay: Duration(
          milliseconds: 500),
      onFind: (text) async {
        print(text);
        return stopsService
            .getStops(
          text ?? "",
          10,
        );
      },
      itemAsString: (item) =>
          item != null
              ? item.name
              : "",
      showSearchBox: true,
      dropdownSearchBaseStyle:
          largeDarkGrey,
      dialogMaxWidth: width * 0.8,
      dropDownButton: Container(),
      popupItemBuilder: (context,
          item, isSelected) {
        return Padding(
          padding:
              const EdgeInsets
                  .all(8.0),
          child: Row(
            children: [
              Icon(item
                  .getStopTypeIcon()),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child:
                    AutoSizeText(
                  item.name,
                  style:
                      largeBlack,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        );
      },
      dropdownBuilder: (context,
          selectedItem) {
        if (selectedItem !=
            null) {
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
      emptyBuilder:
          (context, searchEntry) {
        String text = "";
        if (searchEntry == null ||
            searchEntry.isEmpty) {
          text =
              "Search for a stop or address.";
        } else {
          text =
              "no result found!";
        }
        return Center(
            child: Text(
          text,
          style: largeDarkGrey,
        ));
      },
    
      dropdownSearchDecoration:
          InputDecoration.collapsed(
              hintText:
                  "Tap to search...",
              hintStyle:
                  largeDarkGrey),
    );
  }
}

