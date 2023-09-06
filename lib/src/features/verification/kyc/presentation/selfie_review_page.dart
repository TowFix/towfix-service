import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:towfix_service/src/features/verification/kyc/presentation/id_card_details_page.dart';

class SelfieReviewPage extends ConsumerWidget {
  const SelfieReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Text(
              'Review your selfie',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Theme.of(context).primaryColor),
            ),
            Text(
              'Make sure your face is clearly visible',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
            Container(
              height: 250,
              width: 250,
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Continue'),
                onPressed: () {
                  //push tp SelfieCameraPage
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => const SelfieCameraPage()));
                },
              ),
            ),
            // const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                child: const Text('Try again'),
                onPressed: () {
                  log('-------------------------email>>>>>');
                  //push to SelfieCameraPage
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const IDCardDetailsPage()));
                },
              ),
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
