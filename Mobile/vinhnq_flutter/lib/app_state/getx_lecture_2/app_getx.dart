import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'getx_counter_owner.dart';

class AppGetX extends StatelessWidget {
  const AppGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingAppGetX(),
      title: "GetX App",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PageCounter(),
    );
  }
}

class PageCounter extends StatelessWidget {
  const PageCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Getx"),
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder(
              id: "01",
              init: ControllerSimpleCounter.get(),
              builder: (controller) => Text("${controller.counter}", style: TextStyle(fontSize: 25),),
            ),
            ElevatedButton(
                onPressed: () {
                  ControllerSimpleCounter.get().increment01();
                },
                child: Text("Increment", style: TextStyle(fontSize: 20),)
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(PageNext(), binding: BindingPageNext(),);
                },
                child: Text("Next Page", style: TextStyle(fontSize: 20),)
            ),
          ],
        ),
      ),
    );
  }
}

class PageNext extends StatelessWidget {
  const PageNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page Next"),
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder(
              id: "01",
              init: ControllerSimpleCounter.get(),
              builder: (controller) => Text("01: ${controller.counter}"),
            ),
            GetBuilder(
              id: "02",
              init: ControllerSimpleCounterNext.get(),
              builder: (controller) => Text("02: ${controller.counter}"),
            ),
            ElevatedButton(
                onPressed: () {
                  ControllerSimpleCounterNext.get().increment02();
                },
                child: Text("Increment", style: TextStyle(fontSize: 20),)
            ),
          ],
        ),
      ),
    );
  }
}