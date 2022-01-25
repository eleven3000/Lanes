import 'package:flutter/material.dart';
import 'package:lanes/style/style.dart';

enum MessageType { ERROR, WARNING, INFO }

class MyMessage {
  final MessageType type;
  final String message;

  MyMessage({required this.type, required this.message});
}

class MyErrorHandler {
  static void showMessage(BuildContext context, MyMessage message) {
    if (message.type == MessageType.INFO) {
      showInfo(context, message.message);
    } else if (message.type == MessageType.ERROR) {
      showError(context, message.message);
    }
  }

  static void showError(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: largeWhite,
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 3),
      backgroundColor: red,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(8.0),
    );

    _showSnackbar(context, snackBar);
  }

  static void showInfo(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: largeWhite,
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 3),
      backgroundColor: lightBlue,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(8.0),
    );

    _showSnackbar(context, snackBar);
  }

  static void _showSnackbar(BuildContext context, SnackBar snackBar) {
    ScaffoldMessengerState? scfldMssngr = ScaffoldMessenger.maybeOf(context);

    if (scfldMssngr == null) {
      print(
          "No Scaffold Widget in parent Tree. Can not display Snackbar. \n Error: ${snackBar.content.toString()}");
      return;
    }

    scfldMssngr.showSnackBar(snackBar);
  }
}
