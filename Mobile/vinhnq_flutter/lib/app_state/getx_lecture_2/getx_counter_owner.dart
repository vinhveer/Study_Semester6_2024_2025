import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerSimpleCounter extends GetxController{
  int counter = 0;

  static ControllerSimpleCounter get({String? tag}) => Get
      .find<ControllerSimpleCounter>(tag: tag);

  increment01(){
    counter++;
    update(["01"], counter <= 10);
  }

// increment02(){
//   counter++;
//   update(["02"]);
// }
//
// incrementAll(){
//   counter++;
//   update(["01", "02"]);
// }
}
class ControllerSimpleCounterNext extends GetxController{
  int counter = 0;

  static ControllerSimpleCounterNext get({String? tag}) => Get
      .find<ControllerSimpleCounterNext>(tag: tag);

  increment02(){
    counter++;
    update(["02"], counter <= 10);
  }
}

class BindingPageNext extends Bindings{

  @override
  void dependencies() {
    Get.put(ControllerSimpleCounterNext(), permanent: true);
  }
}
class BindingAppGetX extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => ControllerSimpleCounter(),);
  }
}

class PageSimpleState extends StatelessWidget {
  PageSimpleState({super.key});
  final controller = Get.put(ControllerSimpleCounter());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Simple State"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder(
              init: ControllerSimpleCounter.get(),
              id: "01",
              builder: (controller) => Text("01: ${controller.counter}",
                style: TextStyle(fontSize: 25),),
            ),
            // GetBuilder(
            //   init: ControllerSimpleCounterNext.get(),
            //   id: "02",
            //   builder: (controller) => Text("02: ${controller.counter}",
            //     style: TextStyle(fontSize: 25),),
            // ),
            ElevatedButton(
                onPressed: () {
                  controller.increment01();
                  // ControllerSimpleCounter.get().increment01();
                },
                child: Text("Increment 01", style: TextStyle(fontSize: 20),)
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       controller.increment02();
            //       // ControllerSimpleCounter.get().increment01();
            //     },
            //     child: Text("Increment 02", style: TextStyle(fontSize: 20),)
            // ),
            // ElevatedButton(
            //     onPressed: () {
            //       controller.incrementAll();
            //       // ControllerSimpleCounter.get().increment01();
            //     },
            //     child: Text("Increment All", style: TextStyle(fontSize: 20),)
            // ),
          ],
        ),
      ),
    );
  }
}