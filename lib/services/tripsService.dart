import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:intl/intl.dart';
import 'package:lanes/models/routeModels.dart';
import 'package:lanes/models/routeParameters.dart';

part 'tripsService.chopper.dart';

@ChopperApi(baseUrl: "/trip")
abstract class TripsService extends ChopperService {
  static TripsService create([ChopperClient? client]) => _$TripsService(client);

  @Get()
  Future<Response> _getTrips(@QueryMap() Map<String, dynamic> query);

  @Get(path: "/next")
  Future<Response> _getLaterTrips(@Query("sessionID") String sessionId);

  Future<RouteResponse> getTrips({required RouteParameters parameters}) async {
    if (parameters.from == null || parameters.to == null) {
      return Future.error("Fill in both From and To");
    }
    print(parameters.from!.statelessId + " : " + parameters.to!.statelessId);

    Map<String, dynamic> queryMap = {
      "origin": parameters.from!.statelessId,
      "destination": parameters.to!.statelessId,
    };

    if (parameters.departAt != null) {
      String timeQuery = "departure-";
      timeQuery =
          timeQuery + DateFormat("HHmm:ddMMyyyy").format(parameters.departAt!);
      queryMap["datetime"] = timeQuery;
    }

    if (parameters.arriveAt != null) {
      String timeQuery = "arrival-";
      timeQuery =
          timeQuery + DateFormat("HHmm:ddMMyyyy").format(parameters.arriveAt!);
      queryMap["datetime"] = timeQuery;
    }

    final response = await _getTrips(queryMap).timeout(
      Duration(seconds: 15),
      onTimeout: () => Future.error("timeout"),
    );

    return RouteResponse.fromJson(jsonDecode(response.body));
  }

  Future<RouteResponse> getLaterTrips({required String sessionId}) async {
    final response = await _getLaterTrips(sessionId).timeout(
      Duration(seconds: 15),
      onTimeout: () => Future.error("timeout"),
    );

    return RouteResponse.fromJson(jsonDecode(response.body));
  }
}
