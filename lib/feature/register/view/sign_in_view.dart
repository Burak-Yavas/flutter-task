import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/feature/user/view/subpages/name_field.dart';
import 'package:test_pro/feature/user/view/user_view.dart';
import '../service/register_service.dart';
import '../viewmodel/register_view_model.dart';

class SignInView extends StatelessWidget {
  SignInView({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterViewModel(
        nameController,
        emailController,
        passwordController,
        service: RegisterService(),
      ),
      child: BlocConsumer<RegisterViewModel, LoginState>(
          listener: (context, state) {
        if (state is SignInComplete) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => (NameField())));
        }
      }, builder: (context, state) {
        return buildSignIn(context);
      }),
    );
  }

  Form buildSignIn(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(
          flex: 2,
        ),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Email"),
        ),
        Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: buildEmailTextFormField(),
            )),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Password"),
        ),
        Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: buildPasswordTextFormField(),
            )),
        Center(child: buildForgotPasswordTextButton()),
        const Spacer(flex: 4),
        Center(child: buildContinueTextButton(context)),
        const Spacer(flex: 1)
      ],
    ));
  }

  TextButton buildForgotPasswordTextButton() {
    return TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.grey),
        ),
        onPressed: () {});
  }

  TextButton buildContinueTextButton(BuildContext context) {
    return TextButton(
        child: const Text("Continue", style: TextStyle(color: Colors.white)),
        style: TextButton.styleFrom(
            fixedSize: const Size(300, 10),
            backgroundColor: Colors.grey[600],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        onPressed: () => context.read<RegisterViewModel>().signInEmail());
  }

  TextFormField buildPasswordTextFormField() {
    return TextFormField(
        controller: passwordController,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.4))),
            labelStyle: const TextStyle(color: Colors.black)));
  }

  TextFormField buildEmailTextFormField() {
    return TextFormField(
        controller: emailController,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.4))),
            labelStyle: const TextStyle(color: Colors.black)));
  }
}
