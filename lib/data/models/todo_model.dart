import '../../domain/entities/todo.dart';

class TodoModel extends Todo {
  const TodoModel({required super.id, required super.title, required super.completed});

  factory TodoModel.fromJson(Map<String, dynamic> j) =>
      TodoModel(id: j['id'], title: j['title'] ?? '', completed: j['completed'] ?? false);
}
