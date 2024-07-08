// 在父组件定义状态和改变状态的方法
// 在使用子组件的时候传递状态





import 'package:flutter/material.dart';

void main() {
  return runApp(const ParentWidget());
}


// 创建一个有状态的ParentWidget类
class ParentWidget extends StatefulWidget {
  // 调用构造函数
  const ParentWidget({super.key});


  // createState 是一个生命周期钩子，构建新的 StatefulWidget 时将调用 createState()，StatefulWidget 的子类必须覆盖这个方法
  // StatefulWidget 组件的生命周期钩子有: createState、initState、didChangeDependencies、build、didUpdateWidget、deactivate、dispose

  // 重写 createState 方法
  @override
  State<ParentWidget> createState() => _ParentWidgetCState();
}


class _ParentWidgetCState extends State<ParentWidget> {
  // 定义状态
  bool _active = false;
  // 定义改变状态的方法
  void _handleTapboxChanged() {
    setState(() {
      _active = !_active;
    });
  }

  // 重写 build 方法
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("父传子", style: TextStyle(
            color: Colors.white
          ),),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            InkWell(
              child: const Text("点击"),
              onTap: () {
                _handleTapboxChanged();
              },
            ),
            TabBox(active: _active) // 在使用子组件的时候，传递active参数
          ],
        ),
      ),
    );
  }
}

class TabBox extends StatefulWidget {
  final bool active;
  const TabBox({super.key, required this.active});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.active ? '点击了' : '没点击');
  }
}
