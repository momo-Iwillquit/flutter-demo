import 'package:flutter/material.dart';

class PersonShareDataWidget extends InheritedWidget {
  const PersonShareDataWidget({
    super.key, 
    required this.data, 
    required super.child
  });

  final Person data;

  static PersonShareDataWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PersonShareDataWidget>();
  }

  @override
  bool updateShouldNotify(PersonShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class Person {
  String name;
  int age;
  Person({
    required this.name,
    required this.age
  });
}