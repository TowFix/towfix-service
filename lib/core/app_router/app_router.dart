import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:towfix_service/core/presentation/pages/loading/loading_page.dart';
import 'package:towfix_service/core/presentation/pages/loading/splash_loading_page.dart';
import 'package:towfix_service/src/features/authentication/login/presentation/login_page.dart';
import 'package:towfix_service/src/features/dashboard/dashboard.dart';
import 'package:towfix_service/src/features/map/presentation/map_route_screen.dart';

import '../not_found/not_found_screen.dart';
import '../providers/common.dart';

part 'app_router.g.dart';

enum AppRoute {
  home,
  auth,
  splash,
  signInWithEmail,
  getStarted,
  signUp,
  mapRoute,
  productCategory,
  productDetails,
  checkout,
  orderStatus,
  shop,
  shopOnboarding,
  shopSetup,
  shopCategories,
  categoryView,
  productView,
  createProduct,
  createProductByType,
  editProduct,
}

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  // final hasLoggedInUserAsyncValue = ref.watch(loginStatusProvider);
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: '/',
          name: AppRoute.splash.name,
          builder: (context, state) => const SplashLoadingPage(),
          redirect: (context, state) {
            final loginState = ref.watch(loginStateProvider);
            log('loginState: ${loginState}', name: 'REDIRECTLOGINSTATE');

            final authRepo = ref.read(authRepositoryProvider);
            // //* check if user is logged in
            if (state.location.startsWith('/auth') && loginState) {
              // * check if vendor's shop has been onboarded
              // if (!ref.read(hasOnboardedShopProvider)) {
              //   return '/home/shop/onboarding';
              // }
              log('inside redirect');

              return '/home';
            }
          },
          routes: [
            GoRoute(
                path: 'auth',
                name: AppRoute.auth.name,
                pageBuilder: (context, state) => MaterialPage(
                      key: state.pageKey,
                      fullscreenDialog: true,
                      child: const LoginPage(),
                    ),
                routes: []),
            GoRoute(
                path: 'home',
                name: AppRoute.home.name,
                pageBuilder: (context, state) => MaterialPage(
                      key: state.pageKey,
                      fullscreenDialog: true,
                      child: Dashboard(),
                    ),
                routes: []),
            GoRoute(
                path: 'map-route/:id',
                name: AppRoute.mapRoute.name,
                pageBuilder: (context, state) {
                  final extra = state.extra as Map<String, dynamic>;
                  final id = extra['id'];
                  return MaterialPage(
                    key: state.pageKey,
                    fullscreenDialog: true,
                    child: MapRouteScreen(id: id),
                  );
                },
                routes: []),
          ]),
    ],
    errorBuilder: (context, state) => const NotFoundScreen(),
  );
}
