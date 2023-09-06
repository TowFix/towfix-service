import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_common/ui_common.dart';

import '../../../constants/app_sizes.dart';
import '../../../constants/assets/svgs.dart';

class LoadingDialog extends StatelessWidget {
  final Widget? description;
  const LoadingDialog({super.key, this.description});

  @override
  Widget build(BuildContext context) {
    var primaryColor;
    return Center(
      child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.95,
          // margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Sizes.p20),
          ),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.p20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(Sizes.p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.s/,
                mainAxisSize: MainAxisSize.min,
                children: [
                  gapH16,
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: SvgPicture.asset(Svgs.selfie),
                  ),
                  Text(
                    'TowFix Service',
                  ),
                  gapH32,
                  Transform.scale(
                    scale: 1.1,
                    child: CircularProgressIndicator(
                      color: context.primaryColor,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      strokeWidth: 3,
                    ),
                  ),
                  gapH32,
                  description ?? const Text('Loading...'),
                ],
              ),
            ),
          )),
    );
  }
}
