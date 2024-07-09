import 'package:flutter/material.dart';
import '路由跳转-Navigator-带参数-todo.dart';

class TodoDetail extends StatefulWidget {
  const TodoDetail({super.key});

  @override
  State<TodoDetail> createState() => _TodoDetailState();
}

class _TodoDetailState extends State<TodoDetail> {
  @override
  Widget build(BuildContext context) {

    // 获取参数 并 转换成 Tode 数据类型
    final todo = ModalRoute.of(context)?.settings.arguments as Todo;

    return Scaffold(
      appBar: AppBar(
        title: const Text("todo详情页", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: const Color.fromARGB(255, 84, 60, 190),
            alignment: Alignment.center,
            child: Text("todo项的标题是:: ${todo.title}", style: const TextStyle(color: Colors.white),),
          ),
          Container(
            color: Colors.green,
            alignment: Alignment.center,
            child: Text("todo项的描述是::${todo.description}"),
          ),
        ],
      )
    );
  }
}