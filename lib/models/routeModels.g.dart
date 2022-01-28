// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routeModels.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RouteResponse _$RouteResponseFromJson(Map<String, dynamic> json) =>
    RouteResponse(
      routes: (json['routes'] as List<dynamic>)
          .map((e) => RouteObj.fromJson(e as Map<String, dynamic>))
          .toList(),
      sessionID: json['sessionID'] as String,
    );

Map<String, dynamic> _$RouteResponseToJson(RouteResponse instance) =>
    <String, dynamic>{
      'routes': instance.routes,
      'sessionID': instance.sessionID,
    };

RouteObj _$RouteObjFromJson(Map<String, dynamic> json) => RouteObj(
      distance: json['distance'] as int,
      publicDuration: json['publicDuration'] as String,
      cTime: json['cTime'] as int,
      individualDuration: json['individualDuration'] as String?,
      vehicleTime: json['vehicleTime'] as int,
      parts: (json['parts'] as List<dynamic>)
          .map((e) => RoutePart.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RouteObjToJson(RouteObj instance) => <String, dynamic>{
      'distance': instance.distance,
      'publicDuration': instance.publicDuration,
      'cTime': instance.cTime,
      'individualDuration': instance.individualDuration,
      'vehicleTime': instance.vehicleTime,
      'parts': instance.parts,
    };

RoutePart _$RoutePartFromJson(Map<String, dynamic> json) => RoutePart(
      duration: json['timeMinute'] as int,
      mot: MeansOfTransportation.fromJson(
          json['itdMeansOfTransport'] as Map<String, dynamic>),
      points: (json['itdPoints'] as List<dynamic>)
          .map((e) => RoutePoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      allPointsWithStopovers: (json['itdStopSeqPoints'] as List<dynamic>)
          .map((e) => RoutePoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      coordinates: (json['itdPathCoordinates'] as List<dynamic>)
          .map((e) => Coordinate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoutePartToJson(RoutePart instance) => <String, dynamic>{
      'timeMinute': instance.duration,
      'itdMeansOfTransport': instance.mot,
      'itdPoints': instance.points,
      'itdStopSeqPoints': instance.allPointsWithStopovers,
      'itdPathCoordinates': instance.coordinates,
    };

MeansOfTransportation _$MeansOfTransportationFromJson(
        Map<String, dynamic> json) =>
    MeansOfTransportation(
      name: json['name'] as String,
      shortName: json['shortname'] as String,
      type: json['type'] as int,
      motType: json['motType'] as int?,
      destination: json['destination'] as String,
      routeDescriptionText: json['itdRouteDescText'] as String?,
      productName: json['productName'] as String,
      vehicleOperator: json['itdOperator'] as String?,
    );

Map<String, dynamic> _$MeansOfTransportationToJson(
        MeansOfTransportation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'shortname': instance.shortName,
      'type': instance.type,
      'motType': instance.motType,
      'destination': instance.destination,
      'itdRouteDescText': instance.routeDescriptionText,
      'productName': instance.productName,
      'itdOperator': instance.vehicleOperator,
    };

RoutePoint _$RoutePointFromJson(Map<String, dynamic> json) => RoutePoint(
      stopId: json['stopID'] as String,
      area: json['area'] as String,
      usage: json['usage'] as String,
      name: json['name'] as String,
      place: json['place'] as String,
      platform: json['platform'] as String,
      latitude: (json['y'] as num?)?.toDouble(),
      longitude: (json['x'] as num?)?.toDouble(),
      dateTime: json['datetime'] as int,
      targetDateTime: json['datetimeTarget'] as int?,
    );

Map<String, dynamic> _$RoutePointToJson(RoutePoint instance) =>
    <String, dynamic>{
      'stopID': instance.stopId,
      'area': instance.area,
      'usage': instance.usage,
      'name': instance.name,
      'place': instance.place,
      'platform': instance.platform,
      'y': instance.latitude,
      'x': instance.longitude,
      'datetime': instance.dateTime,
      'datetimeTarget': instance.targetDateTime,
    };

Coordinate _$CoordinateFromJson(Map<String, dynamic> json) => Coordinate(
      latitude: (json['y'] as num).toDouble(),
      longitude: (json['x'] as num).toDouble(),
    );

Map<String, dynamic> _$CoordinateToJson(Coordinate instance) =>
    <String, dynamic>{
      'y': instance.latitude,
      'x': instance.longitude,
    };
