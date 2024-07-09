import 'dart:async';

import 'package:flutter/material.dart';
import '页面通信-事件总线-event_bus-event_bus.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  late String name = "";
  //声明，后面需要销毁
  StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    // 监听事件
    subscription = eventBus.on<ChangeData>().listen((event) {
      setState(() {
        name = event.name;
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第一个页面", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("第一个页面", style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.w700),),
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Text("共享数据为::$name", style: const TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.w700),),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second_page');
            },
            child: const Text("跳转到第二个页面"),
          )
        ],
      ),
    );
  }
}