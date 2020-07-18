import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/Example1/Example1.dart';
import 'package:flutter_bloc_practice/Example2/Example2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Bloc Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/example1': (context) => Example1(),
        '/example2': (context) => Example2(),
      },
      home: Example2(),
    );
  }
}
