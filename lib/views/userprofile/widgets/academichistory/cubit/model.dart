class CourseModel {
  final String code;
  final String name;
  final int creditHours;
  final String grade;

  CourseModel({
    required this.code,
    required this.name,
    required this.creditHours,
    required this.grade,
  });
}

class SemesterModel {
  final String semesterName;
  final double gpa;
  final List<CourseModel> courses;

  SemesterModel({
    required this.semesterName,
    required this.gpa,
    required this.courses,
  });
}
final fakeSemester = SemesterModel(
  semesterName: "خريف 2025",
  gpa: 3.7,
  courses: [
    CourseModel(
      code: "CS-305",
      name: "هياكل البيانات",
      creditHours: 3,
      grade: "A",
    ),
  ],
);
