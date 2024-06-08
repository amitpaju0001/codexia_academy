class StudentModel {
  String stdName;
  String stdFatherName;
  String stdFees;
  String stdVillage;
  String stdJoinDate;

  StudentModel(
      {required this.stdName,
      required this.stdFatherName,
      required this.stdFees,
      required this.stdVillage,
      required this.stdJoinDate});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'name': stdName,
      'fatherName': stdFatherName,
      'fees': stdFees,
      'village': stdVillage,
      'joinDate': stdJoinDate,
    };
    return json;
  }

  static StudentModel fromJson(Map<String, dynamic> studentMap) {
    return StudentModel(
        stdName: studentMap['name'],
        stdFatherName: studentMap['fatherName'],
        stdFees: studentMap['fees'],
        stdVillage: studentMap['village'],
        stdJoinDate: studentMap['joinDate']);
  }
}
