import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lanes/models/stop.dart';

final routeParametersProvider = StateProvider<RouteParameters>((ref) => RouteParameters());

class RouteParameters {
  Stop? from;
  Stop? to;

  RouteParameters({this.from, this.to});
}
