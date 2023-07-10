// ignore: file_names
// ignore_for_file: non_constant_identifier_names, file_names, duplicate_ignore

List<Task> Tasks = [
 Task(Tasks: "This is the first Task", Progress:10),
  Task(Tasks: "This is the second Task", Progress: 20)
];

class Task {
  final String Tasks;
  final int Progress;

  Task({required this.Progress, required this.Tasks});
}