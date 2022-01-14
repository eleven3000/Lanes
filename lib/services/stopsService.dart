import "dart:async";
import 'dart:convert';
import 'package:chopper/chopper.dart';
import 'package:lanes/models/stop.dart';

// This is necessary for the generator to work.
part "stopsService.chopper.dart";

@ChopperApi(baseUrl: "/stops")
abstract class StopsService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static StopsService create([ChopperClient? client]) => _$StopsService(client);

  @Get()
  Future<Response> _getStops(
    @Query("query") String query,
    @Query("limit") int limit,
    @Query("resultTypes") String resultTypes);

  Future<List<Stop>> getStops(String query, int limit,
      {List<String> resultTypes = const ["STOP"]}) async {
    String queryType = "any";

    String resultTypesString = resultTypes.join(",");

    final response =
        await _getStops("$queryType-\"$query\"", limit, resultTypesString);

    StopResponse stopResponse =
        StopResponse.fromJson(jsonDecode(response.body));
    return stopResponse.stops;
  }
}
