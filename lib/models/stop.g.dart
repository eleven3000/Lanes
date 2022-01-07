// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stop _$StopFromJson(Map<String, dynamic> json) => Stop(
      name: json['name'] as String,
      type: json['type'] as String,
      locality: json['locality'] as String,
      matchQuality: json['matchQuality'] as String,
      statelessId: json['stateless'] as String,
      id: json['id'] as String,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StopToJson(Stop instance) => <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'locality': instance.locality,
      'matchQuality': instance.matchQuality,
      'stateless': instance.statelessId,
      'id': instance.id,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
