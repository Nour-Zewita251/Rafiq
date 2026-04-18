class StudentProgressModel {
  final double gpa;
  final String level;
  final int completedHours;
  final int remainingHours;
  final String advisorName;

  StudentProgressModel({
    required this.gpa,
    required this.level,
    required this.completedHours,
    required this.remainingHours,
    required this.advisorName,
  });
}
final fakeStudentProgress = StudentProgressModel(
  gpa: 3.72,
  level: "المستوى الثالث",
  completedHours: 78,
  remainingHours: 42,
  advisorName: "د. أحمد حسن",
);
