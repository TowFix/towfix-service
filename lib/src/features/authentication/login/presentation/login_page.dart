import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:towfix_service/core/presentation/pages/loading/loading_dialog.dart';
import 'package:ui_common/ui_common.dart';
// import 'package:towfix/core/constants/assets/images.dart';
// import 'package:towfix/core/constants/color/colors.dart';
// import 'package:towfix/src/features/authentication/signup/presentation/pages/sign_up_page.dart';

import '../../../../../core/constants/assets/images.dart';
import '../../../../../core/constants/color/colors.dart';
import '../../../../../core/providers/common.dart';
import '../../signup/presentation/pages/sign_up_page.dart';
import '../../widgets/other_authentication_method.dart';

class LoginPage extends ConsumerStatefulWidget {
  static const id = '/login';
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final showPasswordProvider = StateProvider<bool>((ref) => true);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final showPasswordReader = ref.read(showPasswordProvider.notifier);
    final showPassword = ref.watch(showPasswordProvider);

    final cacheService = ref.read(cacheServiceProvider);

    /// auth provider
    final authRepo = ref.read(authRepositoryProvider);

    // databaseRepo
    final databaseRepo = ref.read(databaseRepositoryProvider);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: double.infinity,
                    child: Image.asset(
                      Images.auth,
                      fit: BoxFit.cover,
                    )),
                Text(
                  'Welcome to TowFix.',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                  textScaleFactor: 0.8,
                ),
                // SizedBox(height: 10),
                Text(
                  'Enter email and password to sign in',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  validator: (input) {
                    /// email regex
                    final emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(input!)) {
                      return 'Invalid email';
                    }
                    if (input.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    prefixIcon: Icon(
                      Icons.mail,
                      color: TowFixColors.main.withOpacity(0.4),
                    ),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            color: const Color(0xff3b3b3b).withOpacity(0.56)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: TowFixColors.main.withOpacity(0.4),
                        )),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Password cannot be empty';
                    }

                    /// secure password
                    // final passwordRegex = RegExp(
                    //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

                    // if (!passwordRegex.hasMatch(input)) {
                    //   return 'Password must contain at least \n one uppercase letter, \none lowercase letter, \none number and one special character';
                    // }

                    // if (input.length < 6) {
                    //   return 'Password must be at least 6 characters';
                    // }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    prefixIcon: Icon(
                      Icons.lock_sharp,
                      color: TowFixColors.main.withOpacity(0.4),
                    ),
                    hintStyle: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(
                            color: const Color(0xff3b3b3b).withOpacity(0.56)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: TowFixColors.main.withOpacity(0.4),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          log('valid');
                          // context.pushNamed(AppRoute.sign_up.name);
                          // * start loading
                          showLoading();
                          final authResult =
                              await authRepo.signInWithEmailAndPassword(
                                  emailController.text,
                                  passwordController.text);

                          log('authResult: $authResult');
                          authResult.fold(
                            (failure) {
                              log('failure: $failure');
                              context.pop();
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(failure.message)));
                            },
                            (user) async {
                              log('user: $user');
                              // * save user to database
                              final result =
                                  await databaseRepo.retrieveProfile(user.uid);

                              result.fold((failure) {
                                log('failure: $failure');
                                context.pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(failure.message)));
                              }, (right) {
                                log('right: $right');
                                cacheService.saveProfile(right);
                              });
                            },
                          );
                        } else {
                          log('invalid');
                          return;
                        }
                      },
                      child: const Text('Sign In'),
                    ),
                  ),
                ),
                const OtherAuthenticationMethod(
                  otherMethodLabel: 'or Sign In with',
                ),
                Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SignUpPage()));
                      },
                      child: RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account?',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: const Color(0xff3b3b3b)
                                        .withOpacity(0.56)),
                            children: [
                              TextSpan(
                                  text: ' Sign Up',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(color: TowFixColors.orange))
                            ]),
                      )),
                ),
              ],
            ),
          ),
        ));
  }

  void showLoading() {
    showDialog(
      context: context,
      builder: (context) => LoadingDialog(
        description: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text('By signing in, you agree to our '),
            InkWell(
                onTap: () {
                  // todo: view terms and conditions here
                },
                child: Text(
                  'terms and conditions ',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14,
                        color: context.primaryColor,
                      ),
                )),
            const Text('for using this app'),
          ],
        ),
      ),
      // todo: remove after logic implementation
      barrierDismissible: true,
    );
  }
}
