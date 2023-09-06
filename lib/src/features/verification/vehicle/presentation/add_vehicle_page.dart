import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'vehicles_page.dart';

class AddVehiclePage extends ConsumerStatefulWidget {
  const AddVehiclePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddVehiclePage();
}

class _AddVehiclePage extends ConsumerState<AddVehiclePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Vehicle'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Vehicle Make',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Vehicle Model',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Vehicle Year',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Vehicle Color',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Vehicle Registration Number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              maxLines: 7,
              minLines: 4,
              decoration: const InputDecoration(
                labelText: 'Any additional information',
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
              ),
            ),
            // const SizedBox(height: 20),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     labelText: 'Vehicle Engine Number',
            //     border: OutlineInputBorder(
            //       borderSide: BorderSide(),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 20),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     labelText: 'Vehicle Insurance Company',
            //     border: OutlineInputBorder(
            //       borderSide: BorderSide(),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 20),
            // TextFormField(
            //   decoration: const InputDecoration(
            //     labelText: 'Vehicle Insurance Policy Number',
            //     border: OutlineInputBorder(
            //       borderSide: BorderSide(),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Add Vehicle'),
                onPressed: () {
                  //push tp SelfieCameraPage
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const VehiclesPage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
