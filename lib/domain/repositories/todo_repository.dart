import '../entities/todo.dart';
import '../../core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<Todo>>> getTodos();
}
