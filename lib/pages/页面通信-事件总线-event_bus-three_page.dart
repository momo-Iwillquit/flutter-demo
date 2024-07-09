import 'dart:math';
import 'package:flutter/material.dart';
import '页面通信-事件总线-event_bus-event_bus.dart';


class ThreePage extends StatefulWidget {
  const ThreePage({super.key});

  @override
  State<ThreePage> createState() => _ThreePageState();
}

class _ThreePageState extends State<ThreePage> {

  late String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("第三个页面", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("第三个页面", style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.w700),),
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Text("共享数据为::$name", style: const TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.w700),),
          const SizedBox(height: 100),
          ElevatedButton(
            onPressed: () {
              var list = ["张三", "李四", "王五"];
              Random random = Random();
              int randomIndex = random.nextInt(3);
              print(randomIndex);
              setState(() {
                name = list[randomIndex];
              });
              eventBus.fire(ChangeData(list[randomIndex]));
            },
            child: const Text("更新姓名"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.settings.name == '/');
            },
            child: const Text("跳转回到首页"),
          )
        ],
      ),
    );
  }
}