import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// 入口函数 无返回值
void main() {
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter demo2",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          foregroundColor: Colors.red,
          leading: const Icon(Icons.home, color: Colors.red, size: 18),
          title: const Text("练习listView"),
          centerTitle: true,
          actions: const [
            Icon(Icons.search, color: Colors.red, size: 18),
            SizedBox(
              width: 10,
              height: 0,
            ),
          ]
        ),
          body: Container(
            margin: const EdgeInsets.all(10),
            decoration: const BoxDecoration(color: Colors.red),
            padding: const EdgeInsets.all(10),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(8),
                    alignment: AlignmentDirectional.center,
                    color: Colors.black,
                    child: const Text("以下是listView列表", style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                      child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 72,
                                    height: 72,
                                    child: Image.network(
                                      "https://himg.bdimg.com/sys/portraitn/item/public.1.5fa4ae49.2AGAjtkX61J0UB5YHSb9ng",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      color: const Color.fromARGB(255, 65, 58, 58),
                                      margin: const EdgeInsets.only(top: 2, bottom: 2),
                                      child: ListTile(
                                        title: Text("这是第 ${index+1} 条内容", style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 16
                                        )),
                                        subtitle: Text("这是第 ${index + 1} 条内容的二级标题", style: const TextStyle(
                                          color: Colors.green,
                                          fontSize: 12
                                        )),
                                      ),
                                    )
                                  ) 
                                ]
                              ),
                            ],
                          );
                        }
                      ),
                    )
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
