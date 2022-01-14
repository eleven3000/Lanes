// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripsService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$TripsService extends TripsService {
  _$TripsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = TripsService;

  @override
  Future<Response<dynamic>> _getTrips(Map<String, dynamic> query) {
    final $url = '/trip';
    final $params = query;
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
