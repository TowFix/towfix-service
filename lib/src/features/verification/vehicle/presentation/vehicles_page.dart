import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:towfix_service/src/features/verification/verification_complete_page.dart';

import 'add_vehicle_page.dart';

class VehiclesPage extends ConsumerWidget {
  const VehiclesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                //push to AddVehiclePage
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => const AddVehiclePage()));
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const VerificationCompletePage()));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              ...List.generate(
                  10,
                  (index) => Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.2),
                          //     spreadRadius: 2,
                          //     blurRadius: 2,
                          //     offset: const Offset(0, 3),
                          //   ),
                          // ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Column(
                              children: [
                                Text('Vehicle Make'),
                                Text('Vehicle Model'),
                                // Text('Vehicle Year'),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {},
                                ),
                              ],
                            )
                          ],
                        ),
                      )).toList(),
            ],
          ),
        ));
  }
}
