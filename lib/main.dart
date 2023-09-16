import 'package:flutter/material.dart';
import 'package:todo/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';



void main() async {

  await Hive.initFlutter();

  var box = await Hive.openBox('Mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme:  ThemeData(primarySwatch: Colors.amber),
      home: HomePage(),
    );
  }
}


