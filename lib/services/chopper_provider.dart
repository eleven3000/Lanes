import 'package:chopper/chopper.dart';

class ChopperProvider{
  static late final chopper;

  static init(ChopperClient chopperClient){
    chopper = chopperClient;
  }
}