import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/theme_service.dart';
import '../../../localization/locale_keys.dart';
import '../../controllers/home_controller.dart';
import '../../widgets/lang_theme_action.dart';
import '../../widgets/state_builder.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Lk.homeTitle.tr), actions: const [LangThemeActions()]),
      body: Obx(() => StateBuilder(
        state: controller.state,
        idle: ListView.builder(
          itemCount: controller.todos.length,
          itemBuilder: (_, i) {
            final t = controller.todos[i];
            return ListTile(
              leading: Icon(t.completed ? Icons.check_circle : Icons.radio_button_unchecked),
              title: Text(t.title),
              subtitle: Text('#${t.id}'),
            );
          },
        ),
        loading: const Center(child: CircularProgressIndicator()),
        empty: const Center(child: Text('No todos found')),
        error: _ErrorDecider(),
      )),
    );
  }
}

class _ErrorDecider extends GetView<HomeController> {
  const _ErrorDecider({super.key});
  @override
  Widget build(BuildContext context) {
    final f = controller.failure;
    if (f == null) return const SizedBox.shrink();
    final msg = f.message;
    if (f.runtimeType.toString().contains('NoInternet')) {
      return const Center(child: Text('No internet. Reconnecting…'));
    }
    if (f.runtimeType.toString().contains('Server')) {
      return Center(child: Text('Server error: $msg'));
    }
    return Center(child: Text(msg));
  }
}
