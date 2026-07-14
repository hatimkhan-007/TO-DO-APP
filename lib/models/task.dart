class Task {
  final String label;
  final DateTime dateTime;
  bool isCompleted;

  Task({
    required this.label,
    required this.dateTime,
    this.isCompleted = false,
  });

  static List<Task> tasks = [
    Task(
      label: 'Home Works',
      dateTime: DateTime.parse('2026-07-15 13:30:00'),
    ),
    Task(
      label: 'College Works',
      dateTime: DateTime.parse('2026-07-15 13:30:00'),
    ),
    Task(
      label: 'School Works',
      dateTime: DateTime.parse('2026-07-15 13:30:00'),
    ),
    Task(
      label: 'University Works',
      dateTime: DateTime.parse('2026-07-15 13:30:00'),
    ),
    Task(
      label: 'Relatives Works',
      dateTime: DateTime.parse('2026-07-15 13:30:00'),
    ),
  ];
}
