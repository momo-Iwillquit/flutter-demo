import 'package:event_bus/event_bus.dart';

// 创建一个事件总线实例
EventBus eventBus = EventBus();

// 自定义事件的类，只实现构造函数
class ChangeData {
  String name;
  ChangeData(this.name);
}