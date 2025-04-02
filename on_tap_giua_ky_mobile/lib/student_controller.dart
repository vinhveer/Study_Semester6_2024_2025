import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentController extends GetxController {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController creditController = TextEditingController();
  final TextEditingController feeController = TextEditingController();

  final List<Student> students = [];

  void addStudent() {
    String subject = subjectController.text;
    int credit = int.tryParse(creditController.text) ?? 0;
    int fee = int.tryParse(feeController.text) ?? 0;

    students.add(Student(subject: subject, credit: credit, fee: fee));

    update();
  }
}

class Student {
  String subject;
  int credit;
  int fee;

  Student({
    required this.subject,
    required this.credit,
    required this.fee
  });
}