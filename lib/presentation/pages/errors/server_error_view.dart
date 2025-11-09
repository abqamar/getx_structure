import 'package:flutter/material.dart';

class ServerErrorView extends StatelessWidget {
  final int? code;
  final String? message;
  const ServerErrorView({super.key, this.code, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const Icon(Icons.cloud_off, size: 64),
          const SizedBox(height: 12),
          Text('Server Error ${code ?? ''}'.trim()),
          if (message != null) Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(message!, style: Theme.of(context).textTheme.bodySmall),
          ),
        ]),
      ),
    );
  }
}
