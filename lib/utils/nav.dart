import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Future push(BuildContext context, Widget page, {bool replecement = false}) {
  if (replecement = true) {
    return Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => page));
  }
  return Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}
