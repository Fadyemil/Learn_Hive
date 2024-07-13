import 'package:hive/hive.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
   String name;
  @HiveField(1)
   int grade;

  StudentModel({required this.name, required this.grade});
}
