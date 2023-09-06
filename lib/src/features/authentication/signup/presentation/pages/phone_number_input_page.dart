import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'otp_verification_page.dart';

class PhoneNumberInputPage extends ConsumerWidget {
  const PhoneNumberInputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            IntlPhoneField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
              initialCountryCode: 'GH',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            const SizedBox(height: 20),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Send'),
                onPressed: () {
                  //push tp OTPVerificationPage
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const OTPVerificationPage()));
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
