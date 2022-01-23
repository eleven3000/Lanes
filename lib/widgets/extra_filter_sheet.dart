import 'package:flutter/material.dart';
import 'package:lanes/models/mot_type.dart';
import 'package:lanes/style/style.dart';

class ExtraFilterSheet extends StatefulWidget {
  List<MOTType>? filteredTypes;
   ExtraFilterSheet({
    this.filteredTypes,
    Key? key,
  }) : super(key: key);

  @override
  State<ExtraFilterSheet> createState() => _ExtraFilterSheetState();
}

class _ExtraFilterSheetState extends State<ExtraFilterSheet> {
  late List<MOTType> _filtersSet;

  @override
  void initState() {
    _filtersSet = widget.filteredTypes ?? [];
    super.initState();
  }

  Iterable<Widget> get motFilterWidgets sync* {
    for (final type in getMOTTypes()) {
      yield Padding(
        padding: const EdgeInsets.all(4.0),
        child: FilterChip(
          backgroundColor: lightGrey,
          selectedColor: lightBlue,
          labelPadding: EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 6.0),
          avatar: Icon(type.icon, color: darkGrey,),
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: Text( "Vehicles to exclude in routes",style: largeDarkGrey,),
          ),
                  ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: 
                motFilterWidgets.toList()
            ),
          )
                ],
              )),
          Expanded(child: Container(
            child: BackButton(
              onPressed: (){
                Navigator.pop(context, _filtersSet);
              },
            ),
          ))
        ],
      ),
    );
  }
}