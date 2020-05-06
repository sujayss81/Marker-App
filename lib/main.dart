import 'package:flutter/material.dart';
import 'package:marker/pages/login.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.red,
        primaryColor: Colors.blue[700]
    ),
    debugShowCheckedModeBanner: false,
    home: Login(),
));
