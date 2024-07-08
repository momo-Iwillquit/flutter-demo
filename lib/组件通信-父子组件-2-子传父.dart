
// 在父组件定义状态和改变状态的方法，在使用子组件的时候传递状态和方法名称
// 子组件调用父组件传过来的方法，并传入新状态



import 'package:flutter/material.dart';

void main () {
  return runApp(const ParentWidget());
}

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;
  void _handleTapboxChanged(bool newValve) {
    setState(() {
      _active = newValve;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "子传父",
            style: TextStyle(
              color: Colors.white
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: TipBox(
          active: _active,
          handleTapboxChanged: _handleTapboxChanged
        ),
      ),
    );
  }
}


class TipBox extends StatefulWidget {
  final bool active;
  final Function handleTapboxChanged;
  const TipBox({super.key, required this.active, required this.handleTapboxChanged});

  @override
  State<TipBox> createState() => TipBoxState();
}

class TipBoxState extends State<TipBox> {
  
  onHandlePressed() {
    // 调用父组件传过来的方法，改变父组件的状态，然后父组件又把最新的状态传给子组件
    widget.handleTapboxChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.active ? "active为true" : "active为false",
          style: const TextStyle(
            fontSize: 20,
            color: Colors.green
          ),
        ),
        ElevatedButton(
          child: const Text("点击改变状态"),
          onPressed: () {
            onHandlePressed();
          },
        )
      ],
    );
  }
}