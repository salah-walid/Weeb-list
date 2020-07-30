import 'package:Weeblist/core/managers/RoutesManager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.black
      ),

      initialRoute: RoutesManager.mainPage,
      routes: RoutesManager.generateRoutes(),
    );
  }
}
