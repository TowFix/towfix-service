import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../src/features/authentication/login/presentation/login_page.dart';
import '../../../constants/assets/images.dart';
import '../../../constants/color/colors.dart';
import '../loading/loading_page.dart';

// import 'package:towfix/core/constants/assets/images.dart';
// import 'package:towfix/core/constants/color/colors.dart';
// import 'package:towfix/core/presentation/pages/loading/loading_page.dart';
// import 'package:towfix/src/features/authentication/login/presentation/login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final pageController = PageController();
  @override
  void initState() {
    super.initState();
  }

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      {
        'image': Images.slide1,
        'title': 'Looking to tow you car?',
        'description':
            'Towfix can help you get a tow car to help tow your car to any destination of your choice',
      },
      {
        'image': Images.slide2,
        'title': 'Looking to call a mechanic?',
        'description':
            'Towfix can help you get a mechanic from any mechanic shop around you to look at your car.',
      },
      {
        'image': Images.slide3,
        'title': 'Looking for a mechanic shop around you?',
        'description':
            'Towfix can help you get to a mechanic shop around you to help look at your car.',
      }
    ];

    return Scaffold(
        backgroundColor: TowFixColors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Expanded(
                  flex: 8,
                  child: PageView.builder(
                    itemCount: pages.length,
                    onPageChanged: (index) {
                      setState(() {
                        pageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final String image = pages[index]['image']!;
                      final String title = pages[index]['title']!;
                      final String description = pages[index]['description']!;
                      return Column(
                        children: [
                          Image.asset(image),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              title,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 22,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            description,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        const Spacer(),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              pages.length,
                              (index) => AnimatedContainer(
                                    margin: EdgeInsets.only(right: 5),
                                    height: 10,
                                    width: pageIndex == index ? 50 : 10,
                                    duration: const Duration(milliseconds: 500),
                                    decoration: BoxDecoration(
                                      color:
                                          TowFixColors.grey.withOpacity(0.56),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  )),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoadingPage(
                                            replaceRouteStack: false,
                                            routeName: '',
                                            title: '',
                                            onLoading: () {
                                              Timer(
                                                const Duration(seconds: 5),
                                                () => Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        const LoginPage(),
                                                  ),
                                                ),
                                              );
                                            },
                                          )));
                            },
                            style: ElevatedButton.styleFrom(),
                            child: Text(
                              'Get Started',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: TowFixColors.white,
                                  ),
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
