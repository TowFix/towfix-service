import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FailurePage extends ConsumerWidget {
  const FailurePage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Text(
            message,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Colors.red,
                ),
          )
        ],
      ),
    );
  }
}
