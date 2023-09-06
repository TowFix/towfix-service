import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:towfix_service/src/features/verification/vehicle/presentation/vehicle_verification_start_page.dart';

class IDCardDetailsReviewPage extends ConsumerWidget {
  const IDCardDetailsReviewPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // const SizedBox(height: 100),
            Text(
              'Review your ID Card Deatails',
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
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.green,
              ),
            ),
            // const Spacer(),
            SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Ghana Card Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Continue'),
                onPressed: () {
                  //push tp SelfieCameraPage
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const VehicleVerificationStartPage()));
                },
              ),
            ),
            // const SizedBox(height: 50),
            // SizedBox(
            //   width: double.infinity,
            //   child: TextButton(
            //     child: const Text('Try again'),
            //     onPressed: () {
            //       // log('-------------------------email>>>>>');
            //       //push to SelfieCameraPage
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => const IDCardDetailsReviewPage()));
            //     },
            //   ),
            // ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
