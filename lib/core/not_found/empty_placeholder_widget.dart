import 'package:flutter/material.dart';

import '../../../core/constants/app_sizes.dart';

/// Placeholder widget showing a message and CTA to go back to the home screen.
class EmptyPlaceholderWidget extends StatelessWidget {
  const EmptyPlaceholderWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Sizes.p16),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              message,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            gapH32,
            // PrimaryButton(
            //   onPressed: () =>
            //       // * Pop all routes in the navigation stack until the home
            //       // * screen is reached.
            //       context.goNamed(AppRoute.home.name),
            //   text: 'Go Home'.hardcoded,
            // )
          ],
        ),
      ),
    );
  }
}
