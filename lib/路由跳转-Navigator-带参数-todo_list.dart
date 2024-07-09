import 'package:flutter/material.dart';
import '路由跳转-Navigator-带参数-todo.dart';
import '路由跳转-Navigator-带参数-todo_detail.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    List<Todo>list = [];
    for(var i = 0; i < 20; i++) {
      list.add(Todo("这是第${i+1}条todo的标题", "这是第${i+1}条todo的描述"));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "todo列表",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(list[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TodoDetail(),
                  settings: RouteSettings(
                    arguments: list[index]
                  )
                )    
              );
            },
          );
        }
      )
    );
  }
}