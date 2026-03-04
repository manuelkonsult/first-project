import '../models/entities.dart';

class MockSchoolRepository {
  List<Student> getStudents() => [
        Student(
          id: 'S-1001',
          fullName: 'Amina Yusuf',
          grade: 'Grade 6',
          guardianName: 'Yusuf Kareem',
        ),
        Student(
          id: 'S-1002',
          fullName: 'David Silva',
          grade: 'Grade 8',
          guardianName: 'Maria Silva',
        ),
        Student(
          id: 'S-1003',
          fullName: 'Lina Ahmed',
          grade: 'Grade 7',
          guardianName: 'Nadia Ahmed',
        ),
      ];

  List<Teacher> getTeachers() => [
        Teacher(
          id: 'T-2001',
          fullName: 'Mr. John Carter',
          subject: 'Mathematics',
          email: 'john.carter@greenfield.edu',
        ),
        Teacher(
          id: 'T-2002',
          fullName: 'Ms. Ruth Kato',
          subject: 'Science',
          email: 'ruth.kato@greenfield.edu',
        ),
      ];

  List<SchoolClass> getClasses() => [
        SchoolClass(
          id: 'C-301',
          name: '6A - Mathematics',
          teacherName: 'Mr. John Carter',
          studentCount: 28,
        ),
        SchoolClass(
          id: 'C-302',
          name: '7B - Science',
          teacherName: 'Ms. Ruth Kato',
          studentCount: 31,
        ),
      ];

  List<AttendanceRecord> getTodayAttendance() => [
        AttendanceRecord(
          studentName: 'Amina Yusuf',
          className: '6A - Mathematics',
          status: 'Present',
          date: DateTime.now(),
        ),
        AttendanceRecord(
          studentName: 'David Silva',
          className: '7B - Science',
          status: 'Absent',
          date: DateTime.now(),
        ),
        AttendanceRecord(
          studentName: 'Lina Ahmed',
          className: '7B - Science',
          status: 'Present',
          date: DateTime.now(),
        ),
      ];
}
