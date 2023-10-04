import 'package:flutter/material.dart';
import 'ui/home.dart';

void main() async {
  runApp(MaterialApp(
    home: Home(),
    theme: ThemeData(hintColor: Colors.blueGrey, primaryColor: Colors.blueGrey),
  ));
}
