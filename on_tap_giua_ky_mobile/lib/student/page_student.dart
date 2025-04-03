import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_tap_giua_ky_mobile/student/student_controller.dart';

class PageStudent extends StatefulWidget {
  const PageStudent({super.key});

  @override
  State<PageStudent> createState() => _PageStudentState();
}

class _PageStudentState extends State<PageStudent> {
  final StudentController studentController = Get.put(StudentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý học sinh"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Môn học"),
            TextField(
              controller: studentController.subjectController,
            ),
            SizedBox(height: 30,),
            Text("Số tín chỉ"),
            TextField(
              controller: studentController.creditController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30,),
            Text("Học phí̉"),
            TextField(
              controller: studentController.feeController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      studentController.addStudent();
                    },
                    child: Text("Thêm học sinh mới")
                )
              ],
            ),
            Expanded(
              child: GetBuilder<StudentController>(
                  init: studentController,
                  builder: (controller) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Text("${index + 1}"),
                            title: Text(controller.students[index].subject),
                            subtitle: Text("Học phí: " + controller.students[index].fee),
                            trailing: Text("Số tín chỉ: " + controller.students[index].credit),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: controller.students.length
                    );
                  },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<StudentController>(
          init: studentController,
          builder: (controller) {
            return Container(
              height: 70,
              padding: EdgeInsets.all(20),
              child: Text("Danh sách có ${controller.students.length} sinh viên"),
            );
          },
      )
    );
  }
}
