import 'package:flutter/material.dart';
import '路由跳转-Navigator-带参数-todo_detail.dart';
import '路由跳转-Navigator-带参数-todo_list.dart';

void main () {
  return runApp(MaterialApp(
    routes: {
      '/': (context) => const MyApp(),
      '/todoList': (context) => const TodoList(),
      '/todoDetail': (context) => const TodoDetail(),
    },
    initialRoute: '/',
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("这个是首页", style: TextStyle(color: Colors.green, fontSize: 30, fontWeight: FontWeight.w700),),
            const SizedBox(height: 50, width: double.infinity,),
            ElevatedButton(
              onPressed: () {
                // 两种路由跳转方式都要先配置路由
                
                // 这种是带参数路由跳转
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const TodoList()));

                // 这种是不能带参数的路由跳转
                // Navigator.pushNamed(context, '/todoList');
              }, 
              child: const Text("跳转到todo列表页")
            )
          ],
        ),
      )
    );
  }
}