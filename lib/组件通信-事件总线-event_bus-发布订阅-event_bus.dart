import 'package:event_bus/event_bus.dart';

// 创建一个 EventBus 实例
EventBus eventBus = EventBus();

// 自定义事件，待会用于发布的事件，不是很明白一定要在这里定义吗？这样做不会很分散吗？vue直接在需要发布的时候定义事件

//定义一个更改单位是事件
class UnitChangeEvent {
  String unit;
  UnitChangeEvent(this.unit);
}
