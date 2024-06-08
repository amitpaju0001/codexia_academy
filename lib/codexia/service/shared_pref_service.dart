import 'dart:convert';

import 'package:codexia_academy/codexia/model/student_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService{
  static const String studentKey = 'studentDetails';

 static Future addStudents (StudentModel student)async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> json = student.toJson();

    String stdString = jsonEncode(json);
    List<String> stdList = sharedPreferences.getStringList(studentKey) ?? [];
    stdList.add(stdString);
    sharedPreferences.setStringList(studentKey, stdList);
  }
  static Future<List<StudentModel>> getStudent ()async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   List<String>? jsonList = sharedPreferences.getStringList(studentKey);
   if(jsonList!= null){
     List<StudentModel> studentList = [];
     for(int i=0; i<jsonList.length;i++){
      String jsonStr =  jsonList[i];
      Map<String,dynamic> studentMap = jsonDecode(jsonStr);
      studentList.add(StudentModel.fromJson(studentMap));
     }
     return studentList;
   }
   return [];
  }
  }