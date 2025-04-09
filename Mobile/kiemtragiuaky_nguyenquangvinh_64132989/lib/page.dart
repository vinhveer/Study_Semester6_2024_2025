import 'package:flutter/material.dart';
import 'package:kiemtragiuaky_nguyenquangvinh_64132989/controller.dart';
import 'package:get/get.dart';

class PageExam extends StatefulWidget {
  const PageExam({super.key});

  @override
  State<PageExam> createState() => _PageExamState();
}

class _PageExamState extends State<PageExam> {
  final CalculateController helloController = Get.put(CalculateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nguyễn Quang Vinh"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 650,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Máy tính đơn giản: ", style: TextStyle(fontSize: 18),),
                        SizedBox(width: 10,),
                        Icon(Icons.calculate, size: 40,)
                      ],
                    ),
                    Text("Danh sách kết quả: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                    GetBuilder<CalculateController>(
                      init: helloController,
                        builder: (controller) => Expanded(child: ListView.separated(
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Text("${index + 1}.", style: TextStyle(fontSize: 20),),
                                title: Text(controller.results[index], style: TextStyle(fontSize: 20)),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: controller.results.length)
                        ),
                    )
                  ],
                ),
              ),
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: TextField(
                              decoration: InputDecoration(labelText: "Số thứ nhất"),
                              controller: helloController.oneController,
                              keyboardType: TextInputType.number,
                            )
                        ),
                        Expanded(
                          flex: 2,
                          child: TextButton(
                              onPressed: () {
                                helloController.multiply();
                              },
                              child: Text("✕", style: TextStyle(fontSize: 30),)
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: TextField(
                              decoration: InputDecoration(labelText: "Số thứ hai"),
                              controller: helloController.twoController,
                              keyboardType: TextInputType.number,
                            )
                        ),
                        Expanded(
                          flex: 2,
                          child: TextButton(
                              onPressed: () {
                                helloController.divide();
                              },
                              child: Text("/", style: TextStyle(fontSize: 30),)
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
