import 'package:json_annotation/json_annotation.dart';

part 'routeModels.g.dart';

@JsonSerializable()
class RouteResponse {
  ///Routes
  final List<RouteObj> routes;

  ///Session-ID
  final String sessionID;

  RouteResponse({required this.routes, required this.sessionID});

  factory RouteResponse.fromJson(Map<String, dynamic> json) =>
      _$RouteResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RouteResponseToJson(this);
}

@JsonSerializable()
class RouteObj {
  ///Trip distance
  final int distance;

  ///Route Duration, example: 01:37
  final String publicDuration;

  ///Time of Request (?)
  final int cTime;

  ///Duration with individual Walking speed (?)
  final String? individualDuration;

  ///Time actually spent in vehicles
  final int vehicleTime;

  ///Route parts
  final List<RoutePart> parts;

  RouteObj(
      {required this.distance,
      required this.publicDuration,
      required this.cTime,
      required this.individualDuration,
      required this.vehicleTime,
      required this.parts});

  factory RouteObj.fromJson(Map<String, dynamic> json) => _$RouteObjFromJson(json);

  Map<String, dynamic> toJson() => _$RouteObjToJson(this);
}

@JsonSerializable()
class RoutePart {
  ///Duration of this Part
  @JsonKey(name: "timeMinute")
  final int duration;

  ///Means of Transportation
  @JsonKey(name: "itdMeansOfTransport")
  final MeansOfTransportation mot;

  ///Start and End of the Part
  @JsonKey(name: "itdPoints")
  final List<RoutePoint> points;

  ///List of all Stops including start and End
  @JsonKey(name: "itdStopSeqPoints")
  final List<RoutePoint> allPointsWithStopovers;

  ///List of Waypoints as Coordinates
  @JsonKey(name: "itdPathCoordinates")
  final List<Coordinate> coordinates;

  RoutePart(
      {required this.duration,
      required this.mot,
      required this.points,
      required this.allPointsWithStopovers,
      required this.coordinates});

  factory RoutePart.fromJson(Map<String, dynamic> json) =>
      _$RoutePartFromJson(json);

  Map<String, dynamic> toJson() => _$RoutePartToJson(this);
}

@JsonSerializable()
class MeansOfTransportation {
  ///Name of the Vehicle, empty if Footpath
  final String name;

  ///Name of the Vehicle in short
  @JsonKey(name: "shortname")
  final String shortName;

  ///Type of the Mean of Transport
  final int type;

  ///Type of the Mean of Transport
  final int? motType;

  ///Destination of the MOT
  final String destination;

  ///Description of the MOT
  @JsonKey(name: "itdRouteDescText")
  final String? routeDescriptionText;

  ///Name of the Vehicle Type, "Fussweg" or "Nicht umsteigen"
  final String productName;

  ///Operator of the Vehicle
  @JsonKey(name: "itdOperator")
  final String? vehicleOperator;

  MeansOfTransportation(
      {required this.name,
      required this.shortName,
      required this.type,
      required this.motType,
      required this.destination,
      required this.routeDescriptionText,
      required this.productName,
      required this.vehicleOperator});

  factory MeansOfTransportation.fromJson(Map<String, dynamic> json) =>
      _$MeansOfTransportationFromJson(json);

  Map<String, dynamic> toJson() => _$MeansOfTransportationToJson(this);
}

@JsonSerializable()
class RoutePoint {
  ///ID of the Stop
  @JsonKey(name: "stopID")
  final String stopId;

  ///area
  final String area;

  ///Usage of the Stop, either "arrival", "departure" or "" depending on Stop Context
  final String usage;

  ///Name of the Stop
  final String name;

  ///Name of the Place the Stop is in
  final String place;

  ///platform
  final String platform;

  ///Latitude (x)
  @JsonKey(name: "x")
  final double? latitude;

  ///Longitude (y)
  @JsonKey(name: "y")
  final double? longitude;

  ///Unix Time arriving/departing at/from the Stop
  @JsonKey(name: "datetime")
  final int dateTime;

  ///Target Unix Time arriving/departing at/from the Stop (might be null)
  @JsonKey(name: "datetimeTarget")
  final int? targetDateTime;

  RoutePoint(
      {required this.stopId,
      required this.area,
      required this.usage,
      required this.name,
      required this.place,
      required this.platform,
      required this.latitude,
      required this.longitude,
      required this.dateTime,
      required this.targetDateTime});

  factory RoutePoint.fromJson(Map<String, dynamic> json) =>
      _$RoutePointFromJson(json);

  Map<String, dynamic> toJson() => _$RoutePointToJson(this);
}

@JsonSerializable()
class Coordinate {
  ///Latitude (x)
  @JsonKey(name: "x")
  final double latitude;

  ///Longitude (y)
  @JsonKey(name: "y")
  final double longitude;

  Coordinate({required this.latitude, required this.longitude});

  factory Coordinate.fromJson(Map<String, dynamic> json) =>
      _$CoordinateFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateToJson(this);
}
