import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/constants/color/colors.dart';
import '../../../widgets/other_authentication_method.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
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
                    .titleLarge!
                    .copyWith(color: TowFixColors.grey),
                textScaleFactor: 0.8,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Mail',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  prefixIcon: Icon(
                    Icons.lock_sharp,
                    color: TowFixColors.main.withOpacity(0.4),
                  ),
                  hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
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
                decoration: InputDecoration(
                  hintText: 'Password',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  prefixIcon: Icon(
                    Icons.lock_sharp,
                    color: TowFixColors.main.withOpacity(0.4),
                  ),
                  hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
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
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  prefixIcon: Icon(
                    Icons.lock_sharp,
                    color: TowFixColors.main.withOpacity(0.4),
                  ),
                  hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
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
              //  todo: add phone input here
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
              ),
              const SizedBox(height: 20),
              const OtherAuthenticationMethod(
                otherMethodLabel: 'or Sign In with',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
