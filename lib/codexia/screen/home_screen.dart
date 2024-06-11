import 'package:codexia_academy/codexia/model/student_model.dart';
import 'package:codexia_academy/codexia/service/shared_pref_service.dart';
import 'package:codexia_academy/codexia/widget/student_card_widget.dart';
import 'package:flutter/material.dart';
import 'add_student_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StudentModel> students = [];

  @override
  void initState() {
    super.initState();
    loadStudents();
  }

  Future loadStudents() async {
    List<StudentModel> studentList = await SharedPrefService.getStudent();
    setState(() {
      students = studentList;
    });
  }
 void deleteStudent (StudentModel student){
    setState(() {
      students.remove(student);
    });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Details'),
      ),
      body: ListView.builder(
        itemCount: students.length,
          itemBuilder: (context, index) {
          StudentModel studentModel = students[index];
          return StudentCardWidget(std: studentModel, onDelete: () {
            deleteStudent(students[index]);
          },);
          },),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context,) {
              return const AddStudentScreen();
            }),
          );
        loadStudents();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
