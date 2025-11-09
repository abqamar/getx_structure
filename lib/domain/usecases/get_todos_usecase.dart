import 'package:dartz/dartz.dart';
import '../entities/todo.dart';
import '../repositories/todo_repository.dart';
import '../../core/errors/failures.dart';

class GetTodosUseCase {
  final TodoRepository repo;
  GetTodosUseCase(this.repo);

  Future<Either<Failure, List<Todo>>> call() => repo.getTodos();
}
