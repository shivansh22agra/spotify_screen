

import 'package:flutter/material.dart';
import 'package:spotify_screen/screens/Screen.dart';
import 'package:spotify_screen/screens/screens_try.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
   initialRoute: Screen.id,
      routes: {
        Screen.id:(context) => Screen(),
        Screen_try.id:(context)=>Screen_try()
      },
      
    );
  }
}