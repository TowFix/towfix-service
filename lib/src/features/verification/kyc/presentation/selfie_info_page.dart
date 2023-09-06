import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:towfix_service/core/constants/assets/images.dart';
import 'package:towfix_service/core/constants/assets/svgs.dart';
import 'package:towfix_service/src/features/verification/kyc/presentation/selfie_camera_page.dart';
import 'package:towfix_service/src/features/verification/kyc/presentation/selfie_review_page.dart';

class SelfieInfoPage extends ConsumerWidget {
  const SelfieInfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Column(
          children: [
            Text(
              'Step 1 of 4',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 5),
            Container(
              width: 80,
              height: 5,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 100),
          Text(
            'Take a selfie',
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
            // decoration: BoxDecoration(color: Colors.green),
            child: Image.asset(
              Images.selfie,
              color: Theme.of(context).primaryColor,
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(height: 20),
          Text('We need a selfie to confirm who you say you are',
              style: Theme.of(context).textTheme.titleMedium),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: const Text('Take a selfie'),
              onPressed: () {
                //push to SelfieCameraPage
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SelfieReviewPage()));
              },
            ),
          ),
          // const SizedBox(height: 50),

          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
