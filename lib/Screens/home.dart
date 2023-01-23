import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "ToDo App";
    String containerText = "This is the home screen";

    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: Container(
        child: Text(containerText),
      ),
    );
  }
}
