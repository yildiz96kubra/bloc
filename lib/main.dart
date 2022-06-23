import 'package:bloc/screens/cart_screens.dart';
import 'package:bloc/screens/lesson_list_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     routes: {
      "/" :(BuildContext context) => LessonListScreens(),
      "/cart" :(BuildContext context) => CartScreens(),
     },
     initialRoute: "/" ,
      );
     
  }
}

