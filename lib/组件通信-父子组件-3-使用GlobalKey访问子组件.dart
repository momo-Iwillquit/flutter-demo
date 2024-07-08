// 创建 一个 GlobalKey 的 key，如buttonKey，在使用子组件的时候，作为参数传入，这样就与子组件绑定了
// 在父组件中通过 buttonKey.currentState 调用子组件的方法，如 buttonKey.currentState?.increaseCount();
// 感觉这个作用就像vue refs 访问子组件
// 但 GlobalKey 功能很强大，可以跨足剑数据共享什么的，暂时还没有学到


import 'package:flutter/material.dart';

void main () {
  return runApp( const ParentWidget());
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {

  final GlobalKey<_CounterButtonState> buttonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "使用 GlobalKey",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: [
              CounterButton(key: buttonKey),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text("点击+1", style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.w700),),
                onPressed: () {
                  buttonKey.currentState?.increaseCount();
                },
              ),
              ElevatedButton(
                child: const Text("重置", style: TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.w700),),
                onPressed: () {
                  buttonKey.currentState?.resetCount();
                },
              )
            ],
          ),
        )
      ),
    );
  }
}


class CounterButton extends StatefulWidget {
  const CounterButton({super.key});

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int count = 0;
  void increaseCount() {
    setState(() {
      count++;
    });
  }

  void resetCount() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text("子组件计数为:: $count");
  }
}