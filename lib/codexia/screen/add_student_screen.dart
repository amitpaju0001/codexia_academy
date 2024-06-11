import 'package:codexia_academy/codexia/model/reuse_validator.dart';
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
  final TextEditingController imageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Students'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key:  formKey,
          child: Column(
            children: [
              ReuseTextField(
                controller: nameController,
                hintText: 'Name',
                validator: reuseValidator,
              ),
              ReuseTextField(
                controller: fatherNameController,
                hintText: 'Father Name',
                validator: reuseValidator,
              ),
              ReuseTextField(
                controller: feesController,
                hintText: 'Fees',
                validator: reuseValidator,
              ),
              ReuseTextField(
                controller: villageController,
                hintText: 'Village',
                validator: reuseValidator,
              ),
              ReuseTextField(
                controller: joinDateController,
                hintText: 'Joining Date',
                validator: reuseValidator,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState?.validate()??false) {
                    String name = nameController.text;
                    String fatherName = fatherNameController.text;
                    String fees = feesController.text;
                    String village = villageController.text;
                    String joinDate = joinDateController.text;
                    String image = imageController.text;
                    StudentModel student = StudentModel(
                      stdName: name,
                      stdFatherName: fatherName,
                      stdFees: fees,
                      stdVillage: village,
                      stdJoinDate: joinDate,
                      stdImage: image,
                    );
                    await SharedPrefService.addStudents(student);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Students'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
