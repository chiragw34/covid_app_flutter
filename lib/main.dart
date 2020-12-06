import 'package:covid_app/datasource.dart';
import 'package:flutter/material.dart';
import './homepage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: 'WorkSans',
      primaryColor: primaryBlack,
      accentColor: accentBlack,
    ),
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
