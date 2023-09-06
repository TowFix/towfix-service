import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinput/pinput.dart';

import '../../../../verification/kyc/presentation/start_kyc_page.dart';

class OTPVerificationPage extends ConsumerStatefulWidget {
  const OTPVerificationPage({super.key});

  @override
  ConsumerState<OTPVerificationPage> createState() =>
      _OTPVerificationPageState();
}

class _OTPVerificationPageState extends ConsumerState<OTPVerificationPage> {
  final formKey = GlobalKey<FormState>();
  final obscureTextProvider = StateProvider<bool>((ref) => true);

  @override
  Widget build(BuildContext context) {
    // final obscureText = ref.read(obscureTextProvider.notifier);
    final obscureTextValue = ref.watch(obscureTextProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Text(
              'Add Phone Number',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Theme.of(context).primaryColor),
            ),
            Text(
              'We will send you an OTP verification',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
            Form(
              key: formKey,
              child: Pinput(
                length: 5,
                obscureText: obscureTextValue,
                // Without Validator
                // If true error state will be applied no matter what validator returns
                forceErrorState: true,
                // Text will be displayed under the Pinput
                // errorText: 'Error',

                /// ------------
                /// With Validator
                /// Auto validate after user tap on keyboard done button, or completes Pinput
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                validator: (pin) {
                  if (pin == '2224') return null;

                  /// Text will be displayed under the Pinput
                  return 'Pin is incorrect';
                },
              ),
            ),
            const SizedBox(height: 20),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Done'),
                onPressed: () {
                  //push tp OTPVerificationPage
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StartKYCPage()));
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
