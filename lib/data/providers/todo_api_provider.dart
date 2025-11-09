import 'package:get/get.dart';
import '../../core/network/getconnect_client.dart';
import '../models/todo_model.dart';

class TodoApiProvider {
  final AppGetConnect client;
  TodoApiProvider(this.client);

  Future<List<TodoModel>> fetchTodos() async {
    final Response res = await client.safeGet('/todos');
    final list = (res.body as List).cast<Map<String, dynamic>>();
    return list.map(TodoModel.fromJson).toList();
  }
}
