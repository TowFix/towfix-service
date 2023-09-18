import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:towfix_service/core/providers/common.dart';
import 'package:ui_common/ui_common.dart';

// class ProfilePage extends ConsumerWidget {
//   const ProfilePage({super.key});

//   @override
//   final

//   }
// }

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final cacheService = ref.watch(cacheServiceProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: context.mediaQuery.size.height * 0.1,
              width: double.infinity,
              child: Row(
                children: [
                  SizedBox(
                      width: context.mediaQuery.size.height * 0.1,
                      height: context.mediaQuery.size.height * 0.1,
                      child: CircleAvatar()),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(cacheService.profile.firstName),
                      Text(cacheService.profile.lastName),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
