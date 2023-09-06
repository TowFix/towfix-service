import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:towfix_service/core/app_router/app_router.dart';

import '../../../constants/color/colors.dart';

class SplashLoadingPage extends StatefulWidget {
  final Function()? onLoading;
  const SplashLoadingPage({super.key, this.onLoading});

  @override
  State<SplashLoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<SplashLoadingPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Timer(
        const Duration(seconds: 3),
        () => context.goNamed(AppRoute.auth.name),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 0, 92, 1),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(7, 0, 92, 0.8),
              TowFixColors.black,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
          ),
        ),
        child: Center(
            child: LinearProgressIndicator(
          minHeight: 6,
          backgroundColor: TowFixColors.white,
          color: Theme.of(context).primaryColor,
        )),
      ),
    );
  }
}
