import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stop.g.dart';

@JsonSerializable()
class Stop {
  static final Map<String, IconData> iconMap = {
    "stop": Icons.hail,
    "street": Icons.directions,
    "log": Icons.location_city
  };

  final String name;
  final String type;
  final String locality;
  final String matchQuality;
  @JsonKey(name: "stateless")
  final String statelessId;
  final String id;
  final double? latitude;
  final double? longitude;

  bool isHistory = false;

  Stop(
      {required this.name,
      required this.type,
      required this.locality,
      required this.matchQuality,
      required this.statelessId,
      required this.id,
      required this.latitude,
      required this.longitude});

  IconData getStopTypeIcon() {
    if (isHistory) {
      return Icons.history;
    }
    return iconMap[type] ?? Icons.help;
  }

  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);

  Map<String, dynamic> toJson() => _$StopToJson(this);
}

@JsonSerializable()
class StopResponse {
  ///List of Stops
  final List<Stop> stops;

  StopResponse({required this.stops});

  factory StopResponse.fromJson(Map<String, dynamic> json) =>
      _$StopResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StopResponseToJson(this);
}
