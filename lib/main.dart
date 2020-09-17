import 'package:flutter/material.dart';
import 'package:hepsiburada_clone/ana_yapi.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hepsiburada',
        home: AnaYapi());
  }
}
