import 'package:flutter/material.dart';

import '../../../../core/constants/assets/images.dart';

class OtherAuthenticationMethod extends StatelessWidget {
  final String otherMethodLabel;
  const OtherAuthenticationMethod({
    super.key,
    required this.otherMethodLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          const Expanded(child: Divider()),
          Text(otherMethodLabel),
          const Expanded(child: Divider()),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {}, child: Image.asset(Images.facebookIcon)),
            TextButton(onPressed: () {}, child: Image.asset(Images.googleIcon)),
            TextButton(onPressed: () {}, child: Image.asset(Images.appleIcon)),
          ],
        ),
      ],
    );
  }
}
