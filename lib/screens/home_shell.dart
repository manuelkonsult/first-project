import 'package:flutter/material.dart';

import '../data/mock_school_repository.dart';
import '../models/entities.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key, required this.repository});

  final MockSchoolRepository repository;

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final students = widget.repository.getStudents();
    final teachers = widget.repository.getTeachers();
    final classes = widget.repository.getClasses();
    final attendance = widget.repository.getTodayAttendance();

    final pages = [
      _DashboardTab(
        totalStudents: students.length,
        totalTeachers: teachers.length,
        totalClasses: classes.length,
        absences:
            attendance.where((record) => record.status == 'Absent').length,
      ),
      _StudentsTab(students: students),
      _TeachersTab(teachers: teachers),
      _ClassesTab(classes: classes),
      _AttendanceTab(records: attendance),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Greenfield School Manager'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() => _selectedIndex = index);
            },
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.dashboard_outlined),
                selectedIcon: Icon(Icons.dashboard),
                label: Text('Dashboard'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.school_outlined),
                selectedIcon: Icon(Icons.school),
                label: Text('Students'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_3_outlined),
                selectedIcon: Icon(Icons.person_3),
                label: Text('Teachers'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.class_outlined),
                selectedIcon: Icon(Icons.class_),
                label: Text('Classes'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.fact_check_outlined),
                selectedIcon: Icon(Icons.fact_check),
                label: Text('Attendance'),
              ),
            ],
          ),
          const VerticalDivider(width: 1),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: pages[_selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}

class _DashboardTab extends StatelessWidget {
  const _DashboardTab({
    required this.totalStudents,
    required this.totalTeachers,
    required this.totalClasses,
    required this.absences,
  });

  final int totalStudents;
  final int totalTeachers;
  final int totalClasses;
  final int absences;

  @override
  Widget build(BuildContext context) {
    final cards = [
      ('Students', totalStudents, Icons.school),
      ('Teachers', totalTeachers, Icons.person),
      ('Classes', totalClasses, Icons.class_),
      ('Absences today', absences, Icons.warning_amber),
    ];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Dashboard',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: cards
                .map(
                  (item) => SizedBox(
                    width: 220,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(item.$3),
                            const SizedBox(height: 8),
                            Text(item.$1),
                            const SizedBox(height: 4),
                            Text(
                              '${item.$2}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _StudentsTab extends StatelessWidget {
  const _StudentsTab({required this.students});

  final List<Student> students;

  @override
  Widget build(BuildContext context) {
    return _EntityList(
      title: 'Students',
      children: students
          .map(
            (student) => ListTile(
              leading: const CircleAvatar(child: Icon(Icons.school)),
              title: Text(student.fullName),
              subtitle: Text('${student.grade} • Guardian: ${student.guardianName}'),
              trailing: Text(student.id),
            ),
          )
          .toList(),
    );
  }
}

class _TeachersTab extends StatelessWidget {
  const _TeachersTab({required this.teachers});

  final List<Teacher> teachers;

  @override
  Widget build(BuildContext context) {
    return _EntityList(
      title: 'Teachers',
      children: teachers
          .map(
            (teacher) => ListTile(
              leading: const CircleAvatar(child: Icon(Icons.person_3)),
              title: Text(teacher.fullName),
              subtitle: Text('${teacher.subject} • ${teacher.email}'),
              trailing: Text(teacher.id),
            ),
          )
          .toList(),
    );
  }
}

class _ClassesTab extends StatelessWidget {
  const _ClassesTab({required this.classes});

  final List<SchoolClass> classes;

  @override
  Widget build(BuildContext context) {
    return _EntityList(
      title: 'Classes',
      children: classes
          .map(
            (schoolClass) => ListTile(
              leading: const CircleAvatar(child: Icon(Icons.class_)),
              title: Text(schoolClass.name),
              subtitle: Text(
                'Teacher: ${schoolClass.teacherName} • Students: ${schoolClass.studentCount}',
              ),
              trailing: Text(schoolClass.id),
            ),
          )
          .toList(),
    );
  }
}

class _AttendanceTab extends StatelessWidget {
  const _AttendanceTab({required this.records});

  final List<AttendanceRecord> records;

  @override
  Widget build(BuildContext context) {
    return _EntityList(
      title: 'Today\'s Attendance',
      children: records
          .map(
            (record) => ListTile(
              leading: CircleAvatar(
                backgroundColor: record.status == 'Present'
                    ? Colors.green.shade100
                    : Colors.red.shade100,
                child: Icon(
                  record.status == 'Present' ? Icons.check : Icons.close,
                  color: record.status == 'Present'
                      ? Colors.green.shade700
                      : Colors.red.shade700,
                ),
              ),
              title: Text(record.studentName),
              subtitle: Text('${record.className} • ${record.status}'),
            ),
          )
          .toList(),
    );
  }
}

class _EntityList extends StatelessWidget {
  const _EntityList({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Card(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
            ),
            const Divider(height: 1),
            ...children,
          ],
        ),
      ),
    );
  }
}
