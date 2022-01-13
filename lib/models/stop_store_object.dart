import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:lanes/models/stop.dart';
part 'stop_store_object.g.dart';

@HiveType(typeId: 1)
class StopStoreObject {
  @HiveField(0)
  late final String id;
  @HiveField(1)
  int uses;
  @HiveField(2)
  late final String stopJson;

  StopStoreObject(this.id, this.stopJson, {this.uses = 0});
  StopStoreObject.fromStop(Stop stop, {this.uses = 0}) {
    this.id = stop.id;
    this.stopJson = jsonEncode(stop.toJson());
  }
}
