import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lanes/models/stop.dart';

final routeParametersProvider = StateProvider<RouteParameters>((ref) => RouteParameters());

class RouteParameters {
  Stop? from;
  Stop? to;
  DateTime? departAt;
  DateTime? arriveAt;

  RouteParameters({this.from, this.to, this.departAt, this.arriveAt});
}

Future<DateTime?> showDateTimePicker({required BuildContext context,
 required DateTime initialDate, required DateTime firstDate, required DateTime lastDate}) async{

  var date = await showDatePicker(context: context,
   initialDate: initialDate, firstDate: firstDate, lastDate: lastDate,);
  if(date == null){
    return null;
  }
  var time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(initialDate));
  if(time == null){
    return null;
  }
  
  return date.add(Duration(hours: time.hour, minutes: time.minute));
}
