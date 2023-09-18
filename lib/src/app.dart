import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:towfix_service/core/app_router/app_router.dart';
import 'package:towfix_service/core/localization/string_hardcoded.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'TowFIx',
      restorationScopeId: 'app',
      routerConfig: goRouter,
      onGenerateTitle: (BuildContext context) => 'TowFIx Service'.hardcoded,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: const Color.fromARGB(255, 54, 8, 134),
        scaffoldBackgroundColor: Color.fromARGB(255, 244, 241, 251),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(),
      // themeMode: ThemeMode.dark,
    );
  }
}
