import 'package:flutter/material.dart';
import '../controllers/base_controller.dart';

class StateBuilder extends StatelessWidget {
  final ViewState state;
  final Widget idle;
  final Widget? loading;
  final Widget? empty;
  final Widget? error;
  const StateBuilder({
    super.key,
    required this.state,
    required this.idle,
    this.loading,
    this.empty,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case ViewState.loading: return loading ?? const Center(child: CircularProgressIndicator());
      case ViewState.empty:   return empty   ?? const Center(child: Text('No data'));
      case ViewState.error:   return error   ?? const Center(child: Text('Something went wrong'));
      case ViewState.idle:    return idle;
    }
  }
}
