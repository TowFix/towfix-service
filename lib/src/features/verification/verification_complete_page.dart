import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:towfix_service/src/features/dashboard/dashboard.dart';

class VerificationCompletePage extends ConsumerWidget {
  const VerificationCompletePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Dashboard()));
        },
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Verification Complete',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: Theme.of(context).primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
