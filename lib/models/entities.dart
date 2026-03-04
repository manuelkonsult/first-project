class Student {
  Student({
    required this.id,
    required this.fullName,
    required this.grade,
    required this.guardianName,
  });

  final String id;
  final String fullName;
  final String grade;
  final String guardianName;
}

class Teacher {
  Teacher({
    required this.id,
    required this.fullName,
    required this.subject,
    required this.email,
  });

  final String id;
  final String fullName;
  final String subject;
  final String email;
}

class SchoolClass {
  SchoolClass({
    required this.id,
    required this.name,
    required this.teacherName,
    required this.studentCount,
  });

  final String id;
  final String name;
  final String teacherName;
  final int studentCount;
}

class AttendanceRecord {
  AttendanceRecord({
    required this.studentName,
    required this.className,
    required this.status,
    required this.date,
  });

  final String studentName;
  final String className;
  final String status;
  final DateTime date;
}
