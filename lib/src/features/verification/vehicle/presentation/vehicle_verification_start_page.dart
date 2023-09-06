import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:towfix_service/src/features/verification/vehicle/presentation/add_vehicle_page.dart';

class VehicleVerificationStartPage extends ConsumerWidget {
  const VehicleVerificationStartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Text(
              'Upload Driver\'s License',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Theme.of(context).primaryColor),
            ),
            Text(
              'Please upload your driver\'s license.',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 0,
              color: Colors.black.withOpacity(0.09),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AddVehiclePage()));
                },
                leading: const Icon(
                  Icons.person,
                ),
                title: Text('Step 4',
                    style: Theme.of(context).textTheme.bodySmall),
                subtitle: Text('Add Vehicle Details',
                    style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
            // const Spacer(),
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     child: const Text('Continue'),
            //     onPressed: () {
            //       //push tp SelfieCameraPage
            //       // Navigator.of(context).push(MaterialPageRoute(
            //       //     builder: (context) => const SelfieCameraPage()));
            //     },
            //   ),
            // ),
            // const SizedBox(height: 50),
            // SizedBox(
            //   width: double.infinity,
            //   child: TextButton(
            //     child: const Text('Try again'),
            //     onPressed: () {
            //       // log('-------------------------email>>>>>');
            //       //push to SelfieCameraPage
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => const IDCardDetailsPage()));
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
