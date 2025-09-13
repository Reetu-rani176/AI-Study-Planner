class Subject {
  final String name;
  final String color;
  final String time;
  final bool isCompleted;
  final String? description;

  Subject({
    required this.name,
    required this.color,
    required this.time,
    this.isCompleted = false,
    this.description,
  });
}

class Deadline {
  final String subject;
  final String dueDate;
  final bool isUrgent;
  final String? description;

  Deadline({
    required this.subject,
    required this.dueDate,
    this.isUrgent = false,
    this.description,
  });
}

class StudyStats {
  final int subjects;
  final double hoursToday;
  final int progressPercentage;

  StudyStats({
    required this.subjects,
    required this.hoursToday,
    required this.progressPercentage,
  });
}
