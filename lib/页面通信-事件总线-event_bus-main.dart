import 'dart:async';

import 'package:flutter/material.dart';
import 'pages/页面通信-事件总线-event_bus-first_page.dart';
import 'pages/页面通信-事件总线-event_bus-second_page.dart';
import 'pages/页面通信-事件总线-event_bus-three_page.dart';
import 'pages/页面通信-事件总线-event_bus-event_bus.dart';

void main () {
  return runApp(MaterialApp(
    routes: {
      '/': (context) => const MyApp(),
      '/first_page': (context) => const FirstPage(),
      '/second_page': (context) => const SecondPage(),
      '/three_page': (context) => const ThreePage(),
    },
    initialRoute: '/',
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late String name = "";
  //声明，后面需要销毁
  StreamSubscription? subscription;

  @override
  void initState() {
    subscription = eventBus.on<ChangeData>().listen((event) {
      setState(() {
        name = event.name;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "首页",
            style: TextStyle(
              color: Colors.white
            )
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("首页", style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.w700),),
            const SizedBox(
              width: double.infinity,
              height: 50,
            ),
            Text("共享数据为::$name", style: const TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.w700),),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/first_page');
              },
              child: const Text("跳转到第一个页面"),
            )
          ],
        ),
      )
    );
  }
}