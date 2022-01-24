import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lanes/screens/route_planner_screen.dart';

import 'models/stop_store_object.dart';
import 'services/stopsService.dart';
import 'services/tripsService.dart';

late final chopper;

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(StopStoreObjectAdapter());
  await Hive.openBox<StopStoreObject>('recent');
  chopper = ChopperClient(
    baseUrl: "https://api.lanesapp.de",
    services: [StopsService.create(), TripsService.create()],
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => RoutePlannerScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Roboto"),
    );
  }
}
