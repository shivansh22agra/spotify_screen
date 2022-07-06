

import 'package:flutter/material.dart';
import 'package:spotify_screen/Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen(),
      
    );
  }
}