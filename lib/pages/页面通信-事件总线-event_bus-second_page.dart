import 'package:flutter/material.dart';
import '页面通信-事件总线-event_bus-event_bus.dart';
import 'dart:async';


class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {

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
    return Scaffold(
      appBar: AppBar(
        title: const Text("第二个页面", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("第二个页面", style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.w700),),
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Text("共享数据为::$name", style: const TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.w700),),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/three_page');
            },
            child: const Text("跳转到第三个页面"),
          )
        ],
      ),
    );
  }
}