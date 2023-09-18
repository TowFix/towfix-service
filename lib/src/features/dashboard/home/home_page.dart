import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:towfix_service/core/app_router/app_router.dart';
import 'package:towfix_service/core/constants/assets/svgs.dart';
import 'package:towfix_service/core/dto/address/address.dart';
import 'package:towfix_service/core/dto/profile/profile.dart';
import 'package:towfix_service/core/dto/service_request/service_request.dart';
import 'package:towfix_service/core/providers/common.dart';
import 'package:towfix_service/core/providers/listeners/position_stream_listener/position_stream_listener_service.dart';
import 'package:ui_common/ui_common.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheService = ref.read(cacheServiceProvider);
    final user = cacheService.profile;
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            // color: Colors.grey,
            border: Border.all(color: Colors.grey),
            // borderRadius: BorderRadius.circular(8),
          ),
          child: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ),
        // title: const Text('Home'),
        elevation: 0,
        actions: [
          Badge(
            label: const Text(
              '2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
            ),
            offset: const Offset(-10, 2),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                // color: Colors.grey,
                border: Border.all(color: Colors.grey),
                // borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
              height: 250,
              padding: EdgeInsets.all(20),
              width: double.infinity,
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Hi, ${user.firstName}.',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Theme.of(context).primaryColor,
                                  )),
                          CurrentLocation(),
                        ],
                      ),
                      Spacer(),
                      const UserStatusWidget()
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Search for a service',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                            onPressed: () {
                              //push to filter page
                              log('Filter');
                            },
                            icon: Icon(Icons.filter_list, color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: ref.watch(serviceRequestsProvider).when(data: (response) {
                return ListView.builder(
                  itemCount: response.length,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  itemBuilder: (context, index) {
                    final job = response[index];
                    return JobCard(
                      amount: job.amount,
                      desitnation: job.destination,
                      pickUp: job.origin,
                      requester: job.requester,
                      onAccept: () async {
                        final request = job.copyWith(
                          status: RequestStatus.accepted,
                          requester: cacheService.profile,
                        );

                        context.pushNamed(
                          AppRoute.mapRoute.name,
                          extra: {'id': request.id},
                          pathParameters: {
                            'id': request.id,
                          },
                        );

                        // todo: update db
                        //todo: route to maps screen
                      },
                      onCancel: () async {
                        final request = job.copyWith(
                          status: RequestStatus.cancelled,
                          requester: cacheService.profile,
                        );

                        //todo: send notification to user
                      },
                    );
                  },
                );
              }, error: (error, strackTrace) {
                log('service request: ', error: error, stackTrace: strackTrace);

                return const Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: Text('Error occured while retrieving details'),
                  ),
                );
              }, loading: () {
                return const CircularProgressIndicator();
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({
    required this.pickUp,
    required this.desitnation,
    this.onAccept,
    this.onCancel,
    required this.amount,
    required this.requester,
    super.key,
  });

  final Address pickUp;
  final Address desitnation;
  final Function()? onAccept;
  final Function()? onCancel;
  final Profile requester;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    // backgroundImage: CachedNetworkImageProvider(requester.),
                    ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(requester.firstName),
                    //TODO: change this to widget in customer
                    SizedBox(
                        width: context.mediaQuery.size.width * 0.4,
                        child: Text(
                          pickUp.name,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('GHC $amount',
                        style: Theme.of(context).textTheme.titleLarge),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[100],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Text('Already Paid')),
                  ],
                ),
              ],
            ),
            //* location details
            Row(
              children: [
                Container(
                  // height: 20,
                  width: 40,
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.my_location,
                          color: Theme.of(context).primaryColor),
                      ...List.generate(
                        3,
                        (index) => Container(
                          height: 6,
                          width: 3,
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitledTextWidget(
                      location: pickUp.name,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 3,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    TitledTextWidget(
                      location: desitnation.name,
                      isPickUp: true,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                // TitledTextWidget(),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      primary: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: onAccept,
                    child: const Text('Accept')),
                const SizedBox(width: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    primary: Theme.of(context).primaryColor,
                    side: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  onPressed: onCancel,
                  child: const Text('Cancel'),
                ),
              ],
            ),
          ],
        ));
  }
}

class TitledTextWidget extends StatelessWidget {
  const TitledTextWidget({
    super.key,
    this.isPickUp = false,
    required this.location,
  });

  final String location;
  final bool isPickUp;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(isPickUp ? 'Pickup Location' : 'Destination',
            style: Theme.of(context).textTheme.bodySmall),
        Container(
          width: context.mediaQuery.size.width * 0.6,
          child: Text(
            location,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class CurrentLocation extends ConsumerWidget {
  const CurrentLocation({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Icon(
          Icons.location_on,
          color: context.primaryColor,
          size: 20,
        ),
        Text(
          ref.watch(currentPositionStreamProvider)!.name,
          style: Theme.of(context).textTheme.titleMedium,
          maxLines: 2,
        ),
      ],
    );
  }
}

class UserStatusWidget extends StatelessWidget {
  const UserStatusWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 5),
        const Text('Active')
      ],
    );
  }
}


//todo: hide all other requests