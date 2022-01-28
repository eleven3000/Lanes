import 'package:google_static_maps_controller/google_static_maps_controller.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:lanes/style/style.dart';

part 'routeModels.g.dart';

@JsonSerializable()
class RouteResponse {
  ///Routes
  final List<RouteObj> routes;

  ///Session-ID
  final String sessionID;

  RouteResponse({required this.routes, required this.sessionID});

  factory RouteResponse.combine(
      {required RouteResponse oldRoutes, required RouteResponse newRoutes}) {
    List<RouteObj> combinedRoutes = oldRoutes.routes + newRoutes.routes;
    return RouteResponse(
        routes: combinedRoutes, sessionID: newRoutes.sessionID);
  }

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

  int get partsLength => parts.length;

  RoutePoint get departurePoint => parts.first.points.first;

  RoutePoint get arrivalPoint => parts.last.points.last;

  DateTime get departureTime =>
      DateTime.fromMillisecondsSinceEpoch(departurePoint.dateTime, isUtc: true);

  DateTime get arrivalTime =>
      DateTime.fromMillisecondsSinceEpoch(arrivalPoint.dateTime, isUtc: true);

  Iterable<Path> get paths sync* {
    for (var part in parts) {
      print(part.locations.length);
      yield Path(points: part.locations.toList(), color: darkGrey);
    }
  }

  factory RouteObj.fromJson(Map<String, dynamic> json) =>
      _$RouteObjFromJson(json);

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

  RoutePoint get departurePoint => points.first;

  RoutePoint get arrivalPoint => points.last;

  Iterable<Location> get locations sync* {
    int autoRound = (coordinates.length / 30).ceil();
    for (var i = 0; i < coordinates.length; i++) {
      if (i % autoRound == 0) {
        yield Location(coordinates[i].latitude, coordinates[i].longitude);
      }
    }
  }

  DateTime get departureTime =>
      DateTime.fromMillisecondsSinceEpoch(departurePoint.dateTime, isUtc: true);

  DateTime get arrivalTime =>
      DateTime.fromMillisecondsSinceEpoch(arrivalPoint.dateTime, isUtc: true);

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

  ///Latitude (y)
  @JsonKey(name: "y")
  final double? latitude;

  ///Longitude (x)
  @JsonKey(name: "x")
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
  ///Latitude (y)
  @JsonKey(name: "y")
  final double latitude;

  ///Longitude (x)
  @JsonKey(name: "x")
  final double longitude;

  Coordinate({required this.latitude, required this.longitude});

  factory Coordinate.fromJson(Map<String, dynamic> json) =>
      _$CoordinateFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinateToJson(this);
}
