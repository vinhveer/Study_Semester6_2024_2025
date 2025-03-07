import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerCounter extends GetxController {
  final _counter = 0.obs;

  // Getter
  int get counter => _counter.value;

  increment() {
    _counter.value++;
  }

  decrement() {
    _counter.value--;
  }
}

class PageCounterGetX extends StatelessWidget {
  PageCounterGetX({super.key});
  final controller = Get.put(ControllerCounter());
  final controller2 = Get.put(ControllerCounter(), tag: "my tag");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Counter Example"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text("${controller.counter}", style: TextStyle(fontSize: 20),),),
            GetX<ControllerCounter>(
                tag: "my tag",
                builder: (controller) => Text("${controller.counter}")
            ),
            ElevatedButton(
              onPressed: () {
                controller.increment();
                controller2.increment();
                },
              child: Text(" + ", style: TextStyle(fontSize: 20),),
            ),
            ElevatedButton(
                onPressed:() => controller.decrement() ,
                child: Text(" - ", style: TextStyle(fontSize: 20),)
            )
          ],
        ),
      ),
    );
  }
}
