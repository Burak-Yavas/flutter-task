import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:test_pro/feature/landing/service/landing_service.dart';
import 'package:test_pro/feature/landing/viewmodel/landing_view_model.dart';
import 'package:test_pro/feature/register/view/sign_in_view.dart';
import 'package:test_pro/feature/tabs/view/tabs_view.dart';
import 'package:test_pro/feature/user/view/user_view.dart';

class LandingView extends StatelessWidget {
  LandingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LandingViewModel(service: LandingService()),
      child: BlocConsumer<LandingViewModel, LoginState>(
        listener: (context, state) {
          if (state is LoginComplete) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => (UserView())));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  buildImageSizedBox(),
                  const Spacer(flex: 1),
                  const Text("A Very Special Fitness App For You "),
                  const Spacer(flex: 2),
                  buildEmailTextButton("Continue with e mail", context),
                  const SizedBox(height: 10),
                  buildGoogleTextButton("Continue with google", context),
                  const SizedBox(height: 10),
                  buildFacebookTextButton("Continue with facebook", context),
                  const SizedBox(height: 10),
                  buildWithoutSignUpTextButton(
                      "Continue without signup", context),
                  const Spacer(flex: 3)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox buildImageSizedBox() {
    return SizedBox(
      height: 200,
      width: 200,
      child: Image.asset(
        "assets/images/fitness.png",
        fit: BoxFit.fitWidth,
      ),
    );
  }

  TextButton buildEmailTextButton(String text, BuildContext context) {
    return TextButton(
        child: Text(text,
            style: const TextStyle(
              color: Colors.white,
            )),
        onPressed: () => Navigator.pushNamed(context, 'registerScreen'),
        style: TextButton.styleFrom(
            fixedSize: const Size(300, 10),
            backgroundColor: Colors.yellow[600],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))));
  }

  TextButton buildGoogleTextButton(String text, BuildContext context) {
    return TextButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => context.read<LandingViewModel>().googleSignIn(),
        style: TextButton.styleFrom(
            fixedSize: const Size(300, 10),
            backgroundColor: Colors.red,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))));
  }

  TextButton buildFacebookTextButton(String text, BuildContext context) {
    return TextButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => context.read<LandingViewModel>().googleSignIn(),
        style: TextButton.styleFrom(
            fixedSize: const Size(300, 10),
            backgroundColor: Colors.blue,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))));
  }

  TextButton buildWithoutSignUpTextButton(String text, BuildContext context) {
    return TextButton(
        child: Text(text, style: TextStyle(color: Colors.white)),
        onPressed: () => Navigator.pushNamed(context, 'nameField'),
        style: TextButton.styleFrom(
            fixedSize: const Size(300, 10),
            backgroundColor: Colors.black,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))));
  }
}
