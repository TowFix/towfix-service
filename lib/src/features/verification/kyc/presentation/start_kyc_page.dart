import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'selfie_info_page.dart';

class StartKYCPage extends ConsumerWidget {
  const StartKYCPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: SizedBox.shrink(),
        backgroundColor: Colors.transparent,
        title: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify Account',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Theme.of(context).primaryColor),
            ),
            Text(
              'To proceed with TowFix, we must collect the following information to comply with requlators',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Color(0xffe5e5e5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(
                          Icons.person,
                        ),
                        title: Text('Step 1',
                            style: Theme.of(context).textTheme.bodySmall),
                        subtitle: Text('Take a picture of yourself',
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(
                          Icons.person,
                        ),
                        title: Text('Step 2',
                            style: Theme.of(context).textTheme.bodySmall),
                        subtitle: Text('Upload your National ID Card',
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(
                          Icons.person,
                        ),
                        title: Text('Step 3',
                            style: Theme.of(context).textTheme.bodySmall),
                        subtitle: Text('Upload your Driver\'s License',
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(
                          Icons.person,
                        ),
                        title: Text('Step 4',
                            style: Theme.of(context).textTheme.bodySmall),
                        subtitle: Text('Add Vehicle Details',
                            style: Theme.of(context).textTheme.titleMedium),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Let\'s do this'),
                onPressed: () {
                  //push tp OTPVerificationPage
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SelfieInfoPage()));
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
