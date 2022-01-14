import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:lanes/models/routeModels.dart';
import 'package:lanes/models/routeParameters.dart';

part 'tripsService.chopper.dart';

@ChopperApi(baseUrl: "/trip")
abstract class TripsService extends ChopperService {
  static TripsService create([ChopperClient? client]) => _$TripsService(client);

  @Get()
  Future<Response> _getTrips(@QueryMap() Map<String, dynamic> query);

  Future<RouteResponse> getTrips({required RouteParameters parameters}) async {
    if (parameters.from == null || parameters.to == null) {
      return Future.error("Fill in both From and To");
    }
    print(parameters.from!.statelessId + " : " + parameters.to!.statelessId);

    Map<String, dynamic> queryMap = {
      "origin": parameters.from!.statelessId,
      "destination": parameters.to!.statelessId,
    };

    final response = await _getTrips(queryMap);

    return RouteResponse.fromJson(jsonDecode(response.body));
  }
}
