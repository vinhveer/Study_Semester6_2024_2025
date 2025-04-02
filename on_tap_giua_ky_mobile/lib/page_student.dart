import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_tap_giua_ky_mobile/student_controller.dart';

class PageStudent extends StatefulWidget {
  const PageStudent({super.key});

  @override
  State<PageStudent> createState() => _PageStudentState();
}

class _PageStudentState extends State<PageStudent> {
  final StudentController studentController = Get.put(StudentController());
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý học sinh"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Tên môn học"),
            TextField(
              controller: studentController.subjectController,
            ),
            SizedBox(height: 30),
            Text("Số tín chỉ"),
            TextField(
              controller: studentController.creditController,
            ),
            SizedBox(height: 30),
            Text("Học phí"),
            TextField(
              controller: studentController.feeController,
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      studentController.addStudent();
                    },
                    child: Text("Thêm học sinh")
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
                          title: Text(controller.students[index].subject),
                          subtitle: Text("Học phí: ${controller.students[index].fee} VNĐ"),
                          leading: Text("${index + 1}"),
                          trailing: Text("Số tín chỉ: ${controller.students[index].credit}"),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: controller.students.length
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<StudentController>(
          init: studentController,
        builder: (controller) {
          return Container(
            height: 80,
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Divider(),  // Divider ở trên Text
                Row(
                  children: [
                    Text("Danh sách có ${controller.students.length} sinh viên"),
                  ],
                ),
              ],
            ),
          );
        },
      )
    );
  }
}