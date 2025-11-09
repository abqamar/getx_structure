import 'package:get/get.dart';
import '../../core/errors/failures.dart';

enum ViewState { idle, loading, error, empty }

class BaseController extends GetxController {
  final _state = ViewState.idle.obs;
  final _failure = Rxn<Failure>();

  ViewState get state => _state.value;
  Failure? get failure => _failure.value;

  void setLoading() => _state.value = ViewState.loading;
  void setIdle()    => _state.value = ViewState.idle;
  void setEmpty()   => _state.value = ViewState.empty;
  void setError(Failure f) {
    _failure.value = f;
    _state.value = ViewState.error;
  }
}
