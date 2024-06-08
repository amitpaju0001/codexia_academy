import 'package:codexia_academy/codexia/service/shared_pref_service.dart';
import 'package:codexia_academy/codexia/widget/reuseTextField.dart';
import 'package:flutter/material.dart';
import 'package:codexia_academy/codexia/model/student_model.dart';
class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});
  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}
class _AddStudentScreenState extends State<AddStudentScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController fatherNameController = TextEditingController();
  final TextEditingController feesController = TextEditingController();
  final TextEditingController villageController = TextEditingController();
  final TextEditingController joinDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Students'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ReuseTextField(
              controller: nameController,
              hintText: 'Name',
            ),
            ReuseTextField(
              controller: fatherNameController,
              hintText: 'Father Name',
            ),
            ReuseTextField(
              controller: feesController,
              hintText: 'Fees',
            ),
            ReuseTextField(
              controller: villageController,
              hintText: 'Village',
            ),
            ReuseTextField(
              controller: joinDateController,
              hintText: 'Joining Date',
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String name = nameController.text;
                String fatherName = fatherNameController.text;
                String fees = feesController.text;
                String village = villageController.text;
                String joinDate = joinDateController.text;
                StudentModel student = StudentModel(
                  stdName: name,
                  stdFatherName: fatherName,
                  stdFees: fees,
                  stdVillage: village,
                  stdJoinDate: joinDate,
                );
                await SharedPrefService.addStudents(student);
                Navigator.pop(context);
              },
              child: const Text('Add Students'),
            ),
          ],
        ),
      ),
    );
  }
}
