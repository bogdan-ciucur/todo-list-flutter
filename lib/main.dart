import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String title = "Title";

    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
        
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Home(),
    );
  }
}
