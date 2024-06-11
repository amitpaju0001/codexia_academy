import 'dart:io';

import 'package:codexia_academy/codexia/model/reuse_validator.dart';
import 'package:codexia_academy/codexia/service/shared_pref_service.dart';
import 'package:codexia_academy/codexia/widget/image_pick_widget.dart';
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
  final TextEditingController pendingFeeController = TextEditingController();
  final TextEditingController paidFeeController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Students'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ImagePickWidget(
                  onImagePicked: (pickedImage) {
                    setState(() {
                      image = pickedImage;
                    });
                  },
                ),
                const SizedBox(height: 16,),
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
                  controller: villageController,
                  hintText: 'Village',
                  validator: reuseValidator,
                ),
                ReuseTextField(
                  controller: joinDateController,
                  hintText: 'Joining Date',
                  validator: reuseValidator,
                ),
                ReuseTextField(
                  controller: pendingFeeController,
                  hintText: 'Pending Fees',
                  validator: reuseValidator,
                ),
                ReuseTextField(
                  controller: paidFeeController,
                  hintText: 'Paid Fees',
                  validator: reuseValidator,
                ),
                ReuseTextField(
                  controller: feesController,
                  hintText: 'Total Fees',
                  validator: reuseValidator,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState?.validate() ?? false) {
                      String name = nameController.text;
                      String fatherName = fatherNameController.text;
                      String fees = feesController.text;
                      String village = villageController.text;
                      String joinDate = joinDateController.text;
                      String pendingFee = pendingFeeController.text;
                      String paidFee = paidFeeController.text;
                      String imagePath = image?.path ?? '';
                      if (imagePath.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('please pick an image')));
                      }
                      StudentModel student = StudentModel(
                        stdName: name,
                        stdFatherName: fatherName,
                        stdFees: fees,
                        stdVillage: village,
                        stdJoinDate: joinDate,
                        stdPendingFee: pendingFee,
                        stdPaidFee: paidFee,
                        stdImage: imagePath,
                      );
                      await SharedPrefService.addStudents(student);
                      Navigator.pop(context, imagePath);
                    }
                  },
                  child: const Text('Add Students'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
