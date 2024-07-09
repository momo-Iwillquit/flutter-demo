import 'package:flutter/material.dart';
import '组件通信-事件总线-event_bus-发布订阅-event_bus.dart';

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
          title: const Text("事件总线-event_bus-发布订阅", style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ComponentOne(),
            SizedBox(height: 20),
            ComponentTwo(),
            SizedBox(height: 20),
            ComponentThree(),
          ],
        )
      ),
    );
  }
}


// 组件一
class ComponentOne extends StatefulWidget {
  const ComponentOne({super.key});

  @override
  State<ComponentOne> createState() => _ComponentOneState();
}

class _ComponentOneState extends State<ComponentOne> {

  late String unitText = "";

  @override
  void initState() {
    super.initState();
    // 监听事件
    eventBus.on<UnitChangeEvent>().listen((event) {
      print("组件一监听到单位更改事件");
      setState(() {
        unitText = event.unit;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("这个是组件一", style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.w700),),
        Text("现在的单位是--$unitText")
      ],
    );
  }
}


// 组件二
class ComponentTwo extends StatefulWidget {
  const ComponentTwo({super.key});

  @override
  State<ComponentTwo> createState() => _ComponentTwoState();
}

class _ComponentTwoState extends State<ComponentTwo> {

  String unit = "广西大学";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 5),
        const Text("这个是组件二", style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.w700),),
        Text("现在的单位是--$unit"),
        ElevatedButton(
          child: const Text("点击改变状态"),
          onPressed: () {
            // 发布事件
            print("组件二发布更改单位事件");
            eventBus.fire(UnitChangeEvent("湖南大学"));
          },
        )
      ],
    );
  }
}


// 组件三
class ComponentThree extends StatefulWidget {
  const ComponentThree({super.key});

  @override
  State<ComponentThree> createState() => _ComponentThreeState();
}

class _ComponentThreeState extends State<ComponentThree> {

  late String unitText = "";

  @override
  void initState() {
    super.initState();
    // 监听事件
    eventBus.on<UnitChangeEvent>().listen((event) {
      print("组件三监听到单位更改事件");
      setState(() {
        unitText = event.unit;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(height: 5),
        const Text("这个是组件三", style: TextStyle(fontSize: 20, color: Colors.red, fontWeight: FontWeight.w700),),
        Text("现在的单位是--$unitText")
      ],
    );
  }
}