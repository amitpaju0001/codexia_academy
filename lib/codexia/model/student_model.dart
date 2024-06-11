

class StudentModel {
  String stdName;
  String stdFatherName;
  String stdFees;
  String stdVillage;
  String stdJoinDate;
  String stdImage;
  String stdPendingFee;
  String stdPaidFee;

  StudentModel(
      {required this.stdName,
      required this.stdFatherName,
      required this.stdFees,
      required this.stdVillage,
      required this.stdJoinDate,
      required this.stdImage,
      required this.stdPendingFee,
      required this.stdPaidFee});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      'name': stdName,
      'fatherName': stdFatherName,
      'fees': stdFees,
      'village': stdVillage,
      'joinDate': stdJoinDate,
      'image': stdImage,
      'pendingFee': stdPendingFee,
      'paidFee' : stdPaidFee,
    };
    return json;
  }

  static StudentModel fromJson(Map<String, dynamic> studentMap) {
    return StudentModel(
        stdName: studentMap['name'],
        stdFatherName: studentMap['fatherName'],
        stdFees: studentMap['fees'],
        stdVillage: studentMap['village'],
        stdJoinDate: studentMap['joinDate'],
        stdImage: studentMap['image']?? '',
      stdPendingFee: studentMap['pendingFee']??'',
      stdPaidFee: studentMap['paidFee'],

    );
  }
}
