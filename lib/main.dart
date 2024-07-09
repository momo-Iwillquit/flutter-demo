import 'package:flutter/material.dart';

void main () {
  return runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("flutter", style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: const Text("hello futter"),
      ),
    );
  }
}