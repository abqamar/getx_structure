import 'package:get/get.dart';
import '../../core/network/connectivity_service.dart';
import '../../core/network/getconnect_client.dart';
import '../../data/providers/todo_api_provider.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../../domain/usecases/get_todos_usecase.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    final connectivity = Get.find<ConnectivityService>();
    final client = Get.put(AppGetConnect(connectivity), permanent: true);

    final provider = Get.put(TodoApiProvider(client));
    final repo = Get.put(TodoRepositoryImpl(provider));
    final usecase = Get.put(GetTodosUseCase(repo));

    Get.put(HomeController(usecase, connectivity));
  }
}
