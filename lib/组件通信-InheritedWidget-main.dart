import 'package:flutter/material.dart';
import '组件通信-InheritedWidget-person_share_data_widget.dart';

void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "test",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: const GrandFather(),
    );
  }
}

class GrandFather extends StatefulWidget {
  const GrandFather({super.key});

  @override
  State<GrandFather> createState() => _GrandFatherState();
}

class _GrandFatherState extends State<GrandFather> {
  Person person = Person(name: "张三", age: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("使用 InheritedWidget 上下文传值", style: TextStyle(
          color: Colors.white
        )),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: PersonShareDataWidget(
        data: person,
        child: Column(
          children: [
            const Text("祖先组件"),
            const Child(),
            ElevatedButton(
              child: const Text("changeData"),
              onPressed: () {
                setState(() {
                  person = Person(name: "李四", age: 19);
                });
              },
            )
          ],
        )
      ),
    );
  }
}

class Child extends StatefulWidget {
  const Child({super.key});

  @override
  State<Child> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    Person person = PersonShareDataWidget.of(context)!.data;
    return Text("姓名为:: ${person.name.toString()}, 年龄为:: ${person.age.toString()}");
  }
}