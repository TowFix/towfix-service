import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:towfix_service/core/constants/app_sizes.dart';
import 'package:towfix_service/core/dto/profile/profile.dart';
import 'package:towfix_service/core/presentation/pages/loading/loading_dialog.dart';
import 'package:towfix_service/core/presentation/pages/loading/loading_page.dart';
import 'package:towfix_service/core/providers/common.dart';
import 'package:ui_common/ui_common.dart';

import '../../../../../../core/constants/color/colors.dart';
import '../../../widgets/other_authentication_method.dart';
import 'phone_number_input_page.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final showPasswordProvider = StateProvider<bool>((ref) => true);
  final showConfirmPasswordProvider = StateProvider<bool>((ref) => true);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final showPasswordReader = ref.read(showPasswordProvider.notifier);
    final showPassword = ref.watch(showPasswordProvider);
    final showConfirmPasswordReader =
        ref.read(showConfirmPasswordProvider.notifier);
    final showConfirmPassword = ref.watch(showConfirmPasswordProvider);

    final cacheService = ref.read(cacheServiceProvider);

    /// auth provider
    final authRepo = ref.read(authRepositoryProvider);

    // databaseRepo
    final databaseRepo = ref.read(databaseRepositoryProvider);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Text(
                  'Create Account.',
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                  textScaleFactor: 0.8,
                ),
                Text(
                  'Enter email and password to sign up',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: TowFixColors.grey),
                  textScaleFactor: 0.8,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: firstNameController,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Firstname cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'First Name',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: TowFixColors.main.withOpacity(0.4),
                        )),
                    prefixIcon: const Icon(FontAwesomeIcons.user),
                  ),
                ),
                gapH20,
                TextFormField(
                  controller: lastNameController,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Last name cannot be empty';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: TowFixColors.main.withOpacity(0.4),
                        )),
                    prefixIcon: const Icon(FontAwesomeIcons.user),
                  ),
                ),
                gapH20,
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: 'Username',
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
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: showPassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return 'Password cannot be empty';
                    }

                    /// secure password
                    final passwordRegex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$');

                    if (!passwordRegex.hasMatch(input)) {
                      return 'Password must contain at least \n one uppercase letter, \none lowercase letter, \none number and one special character';
                    }

                    if (input.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
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
                    suffixIcon: IconButton(
                      onPressed: () {
                        showPasswordReader.state = !showPassword;
                      },
                      icon: const Icon(FontAwesomeIcons.eye),
                      iconSize: 20,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: TowFixColors.main.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: showConfirmPassword,
                  validator: (input) {
                    if (input != passwordController.text) {
                      return 'Passwords do not match';
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
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
                    suffixIcon: IconButton(
                      onPressed: () {
                        showConfirmPasswordReader.state = !showConfirmPassword;
                      },
                      icon: const Icon(FontAwesomeIcons.eye),
                      iconSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => LoadingPage(
                        //             title: 'Loading',
                        //             routeName: 's',
                        //             replaceRouteStack: false)));

                        if (_formKey.currentState!.validate()) {
                          log('valid');
                          // context.pushNamed(AppRoute.sign_up.name);
                          // * start loading
                          showLoading();
                          final authResult =
                              await authRepo.createUserWithEmailAndPassword(
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
                              // datetime to timestamp
                              // final dob = dobReader.state!.millisecondsSinceEpoch;

                              final profile = Profile.initial().copyWith(
                                firstName: firstNameController.text,
                                lastName: lastNameController.text,
                                email: emailController.text,
                                id: user.uid,
                              );

                              log('user: $user');
                              // * save user to database
                              final result =
                                  await databaseRepo.saveProfile(profile);

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
                      child: Text('Sign Up')),
                ),
                const SizedBox(height: 20),
                const OtherAuthenticationMethod(
                  otherMethodLabel: 'or Sign In with',
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
