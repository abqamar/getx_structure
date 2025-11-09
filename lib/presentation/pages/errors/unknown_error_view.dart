import 'package:flutter/material.dart';

class UnknownErrorView extends StatelessWidget {
  final String message;
  const UnknownErrorView({super.key, this.message = 'Something went wrong'});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(child: Text(message)),
  );
}
