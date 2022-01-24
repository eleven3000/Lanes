import 'package:flutter/material.dart';

final MOTBUS = MOTType(
  name: "Bus",
  icon: Icons.directions_bus,
);
final MOTTRAIN = MOTType(name: "Train", icon: Icons.directions_train);
final MOTTRAM = MOTType(name: "Tram", icon: Icons.tram);
final MOTPLANE = MOTType(name: "Plane", icon: Icons.local_airport);
final MOTCAR = MOTType(name: "Car", icon: Icons.directions_car);
final MOTWALK = MOTType(name: "Walk", icon: Icons.directions_walk);
final MOTSEATED =
    MOTType(name: "Stay seated", icon: Icons.airline_seat_recline_normal);

final _motTypeMap = {
  0: MOTTRAIN,
  1: MOTTRAIN,
  2: MOTTRAIN,
  3: MOTTRAM,
  4: MOTTRAM,
  5: MOTBUS,
  6: MOTBUS,
  7: MOTBUS,
  8: MOTTRAM,
  9: MOTBUS,
  10: MOTBUS,
  11: MOTTRAM,
  12: MOTPLANE,
  13: MOTTRAIN,
  14: MOTTRAIN,
  15: MOTTRAIN,
  16: MOTTRAIN,
  17: MOTBUS,
  18: MOTTRAIN,
  19: MOTCAR,
  20: MOTWALK,
  21: MOTSEATED
};

Map<int, MOTType> getMOTTypeMap() {
  return _motTypeMap;
}

List<MOTType> getMOTTypes() {
  return _motTypeMap.values.toSet().toList();
}

List<MOTType> getMOTTypesFilterable() {
  List<MOTType> list = _motTypeMap.values.toSet().toList();
  list.remove(MOTSEATED);
  return list;
}

List<int> getAllMOTTypeIdsForType(MOTType motType) {
  var list = <int>[];
  _motTypeMap.forEach((key, value) {
    if (value == motType) {
      list.add(key);
    }
  });
  return list;
}

class MOTType {
  final String name;
  final IconData icon;

  MOTType({required this.name, required this.icon});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is MOTType && other.name == name && other.icon == icon;
  }

  @override
  String toString() {
    return name;
  }
}
