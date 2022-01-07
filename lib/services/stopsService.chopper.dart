// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stopsService.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$StopsService extends StopsService {
  _$StopsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = StopsService;

  @override
  Future<Response<dynamic>> _getStops(
      String query, int limit, String resultTypes) {
    final $url = '/stops';
    final $params = <String, dynamic>{
      'query': query,
      'limit': limit,
      'resultTypes': resultTypes
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
