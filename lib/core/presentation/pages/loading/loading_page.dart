import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:towfix_service/core/dto/failure/failure.dart';
import 'package:towfix_service/core/presentation/pages/failure_page.dart';

import '../../../constants/color/colors.dart';

class LoadingPage extends StatefulWidget {
  final Function()? onLoading;
  const LoadingPage(
      {super.key,
      this.onLoading,
      required this.title,
      this.description,
      required this.routeName,
      this.completer,
      this.arguments,
      required this.replaceRouteStack});

  final String title;
  final String? description;
  final String routeName;
  final Completer? completer;
  final dynamic arguments;
  final bool replaceRouteStack;

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.completer != null) {
        widget.completer!.future.then((value) {
          if (widget.replaceRouteStack) {
            // Navigator.pushNamedAndRemoveUntil(
            //   context,
            //   widget.routeName,
            //   (route) => false,
            //   arguments: widget.arguments,
            // );
          } else {
            // Navigator.pushReplacementNamed(
            //   context,
            //   widget.routeName,
            //   arguments: widget.arguments,
            // );
          }
        }).onError((error, stackTrace) {
          log(
            "Loading failure",
            error: error,
            stackTrace: stackTrace,
          );

          const String unknownErrMessage =
              "Operation failed, try again or contact support.";

          final String message;
          if (error is Failure) {
            message = error.message;
          } else {
            message = unknownErrMessage;
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => FailurePage(
                // title: 'Oops, something happen',
                message: message,
                // buttonTitle: 'Go back',
                // onPressed: () {
                //   // navigate to previous screen before this loading screen
                //   int navigationCount = 0;
                //   Navigator.popUntil(
                //       context, (route) => navigationCount++ == 2);
                // },
              ),
            ),
          );
        });
      }
    });
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
