import 'package:dartz/dartz.dart';
import '../../core/errors/error_mapper.dart';
import '../../core/errors/failures.dart';
import '../../domain/entities/todo.dart';
import '../../domain/repositories/todo_repository.dart';
import '../providers/todo_api_provider.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoApiProvider api;
  TodoRepositoryImpl(this.api);

  @override
  Future<Either<Failure, List<Todo>>> getTodos() async {
    try {
      final data = await api.fetchTodos();
      return Right(data);
    } catch (e) {
      return Left(mapException(e));
    }
  }
}
