import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:towfix/core/constants/color/colors.dart';

class LoadingPage extends StatefulWidget {
  final Function()? onLoading;
  const LoadingPage({super.key, this.onLoading});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.onLoading != null) {
        widget.onLoading!();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 0, 92, 1),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: const BoxDecoration(
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
