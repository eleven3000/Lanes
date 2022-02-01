import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lanes/models/mot_type.dart';
import 'package:lanes/models/routeParameters.dart';
import 'package:lanes/models/stop_store_object.dart';
import 'package:lanes/services/chopper_provider.dart';
import 'package:lanes/services/stopsService.dart';
import 'package:lanes/style/style.dart';
import 'package:lanes/widgets/stop_search_box.dart';

class ExtraFilterSheet extends StatefulWidget {
  final List<MOTType>? filteredTypes;
  final double width;

  ExtraFilterSheet({
    this.filteredTypes,
    Key? key,
    required this.width,
  }) : super(key: key);

  @override
  State<ExtraFilterSheet> createState() => _ExtraFilterSheetState();
}

class _ExtraFilterSheetState extends State<ExtraFilterSheet> {
  late List<MOTType> _filtersSet;
  late Box<StopStoreObject> _box;
  late var _stopsService;

  @override
  void initState() {
    _filtersSet = widget.filteredTypes ?? [];
    _box = Hive.box('recent');
    _stopsService = ChopperProvider.chopper.getService<StopsService>();
    super.initState();
  }

  Iterable<Widget> get motFilterWidgets sync* {
    for (final type in getMOTTypesFilterable()) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          backgroundColor: lightGrey,
          selectedColor: lightBlue,
          labelPadding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
          avatar: Icon(
            type.icon,
            color: darkGrey,
          ),
          label: Text(type.name, style: largeDarkGrey),
          selected: _filtersSet.contains(type),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                _filtersSet.add(type);
              } else {
                _filtersSet.remove(type);
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        "Vehicles to exclude in routes",
                        style: largeDarkGrey,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: lightGrey),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: motFilterWidgets.toList()),
                    ),
                  )
                ],
              )),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        "Via Stop:",
                        style: largeDarkGrey,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: lightGrey),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Via",
                              style: defaultLightGrey,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: StopSearchBox(
                                    stopsService: _stopsService,
                                    width: widget.width,
                                    box: _box,
                                    searchType: SearchType.VIA,
                                  ),
                                ),
                                Expanded(
                                  child: Consumer(
                                    builder: (context, ref, child) {
                                      return IconButton(
                                          onPressed: () {
                                            setState(() {
                                              ref
                                                  .read(routeParametersProvider)
                                                  .via = null;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.clear,
                                            color: lightGrey,
                                          ));
                                    },
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
          Flexible(
            flex: 1,
            child: Center(
              child: TextButton(
                child: Text(
                  "Save",
                  style: largeWhite,
                ),
                style: blueButtonRoundedStyle,
                onPressed: () {
                  Navigator.pop(context, _filtersSet);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
