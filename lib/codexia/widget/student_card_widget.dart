import 'dart:io';

import 'package:codexia_academy/codexia/model/student_model.dart';
import 'package:flutter/material.dart';

class StudentCardWidget extends StatelessWidget {
  const StudentCardWidget({required this.std, super.key, required this.onDelete});

  final StudentModel std;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Delete Student'),
            content: Text(
              'Confirm Delete'
            ),
            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text('Cancel')),
              TextButton(onPressed: () {
                Navigator.of(context).pop();
                onDelete();
              }, child: Text('Delete')),
            ],
          );
        },);
      },
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (std.stdImage.isNotEmpty)
                Image.file(
                  File(std.stdImage),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              studentRecord('Name', std.stdName),
              const SizedBox(height: 8),
              studentRecord('FatherName', std.stdFatherName),
              const SizedBox(height: 8),
              studentRecord('Village', std.stdVillage),
              const SizedBox(height: 8),
              studentRecord('Joining Date', std.stdJoinDate),
              const SizedBox(height: 8),
              studentRecord('Pending Fees', std.stdPendingFee),
              const SizedBox(height: 8),
              studentRecord('Paid Fees', std.stdPaidFee),
              const SizedBox(height: 8),
              studentRecord('Total Fees', std.stdFees),

            ],
          ),
        ),
      ),
    );
  }

  Widget studentRecord(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

}
