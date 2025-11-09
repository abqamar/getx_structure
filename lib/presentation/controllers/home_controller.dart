import 'package:get/get.dart';
import '../../domain/usecases/get_todos_usecase.dart';
import '../../domain/entities/todo.dart';
import 'base_controller.dart';
import '../../core/network/connectivity_service.dart';
import '../../core/errors/failures.dart';

class HomeController extends BaseController {
  final GetTodosUseCase getTodos;
  final ConnectivityService connectivity;

  final todos = <Todo>[].obs;

  HomeController(this.getTodos, this.connectivity);

  @override
  void onReady() {
    super.onReady();
    ever<ConnectionStatus>(connectivity.rx, (status) {
      if (status == ConnectionStatus.online &&
          state == ViewState.error &&
          (failure is NoInternetFailure)) {
        load();
      }
    });
    load();
  }

  Future<void> load() async {
    setLoading();
    final result = await getTodos();
    result.fold(
            (f) => setError(f),
            (list) {
          if (list.isEmpty) setEmpty(); else {
            todos.assignAll(list.take(20)); // sample
            setIdle();
          }
        }
    );
  }
}
