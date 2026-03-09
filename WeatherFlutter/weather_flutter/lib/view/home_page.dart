import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Weather"), centerTitle: true),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Container(
            child: Text("Hi this is my weather app"),
          )
        ]),
      ),
    );
  }
}
