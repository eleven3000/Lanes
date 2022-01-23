import 'package:flutter/material.dart';

final MOTBUS = MOTType(name: "Bus", icon: Icons.directions_bus,);
final MOTTRAIN = MOTType(name: "Train", icon: Icons.directions_train);
final MOTTRAM = MOTType(name: "Tram", icon: Icons.directions_subway);
final MOTPLANE = MOTType(name: "Plane", icon: Icons.local_airport);

final _motTypeMap = {
  0 : MOTBUS,
  1 : MOTBUS,
  2 : MOTTRAIN,
  3 : MOTTRAM,
  4 : MOTPLANE 
};

Map<int, MOTType> getMOTTypeMap(){
  return _motTypeMap;
}

List<MOTType> getMOTTypes(){
  return _motTypeMap.values.toSet().toList();
}

List<int> getAllMOTTypeIdsForType(MOTType motType){
  var list = <int>[];
  _motTypeMap.forEach((key, value) {
    if(value == motType){
      list.add(key);
    }
    });
  return list;
}

class MOTType{
  final String name;
  final IconData icon;

  MOTType({required this.name, required this.icon});
  
@override
bool operator ==(Object other) {
  if (identical(this, other))
    return true;
  if (other.runtimeType != runtimeType)
    return false;
  return other is MOTType
      && other.name == name
      && other.icon == icon;
  }

  @override
  String toString() {
    return name;
  }
}