import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/feature/user/view/user_view.dart';
import '../service/register_service.dart';
import '../viewmodel/register_view_model.dart';

class SignUpView extends StatelessWidget {
  SignUpView({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController? reWritePasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterViewModel(
          nameController, emailController, passwordController,
          service: RegisterService(),
          reWritePasswordController: reWritePasswordController),
      child: BlocConsumer<RegisterViewModel, LoginState>(
          listener: (context, state) {
        if (state is SignUpComplete) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => (UserView())));
        }
      }, builder: (context, state) {
        return buildSignUp(context);
      }),
    );
  }

  Form buildSignUp(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Email",
          ),
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
          child: Text(
            "Create Password",
          ),
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
              child: buildPasswordTextFormField(context),
            )),
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Re-write Password",
          ),
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
              child: buildReWriteTextFormField(context),
            )),
        const SizedBox(height: 50),
        const Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Privacy Police"),
          ),
        ),
        Center(
          child: buildContinueTextButton(context),
        )
      ],
    ));
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

  TextButton buildContinueTextButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          fixedSize: const Size(300, 10),
          backgroundColor: Colors.grey[600],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
      child: const Text(
        "Continue",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => context.read<RegisterViewModel>().signUpEmail(),
    );
  }

  TextFormField buildReWriteTextFormField(BuildContext context) {
    return TextFormField(
        obscureText: context.watch<RegisterViewModel>().isLockOpen,
        controller: reWritePasswordController,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(Icons.remove_red_eye_outlined),
              onPressed: () =>
                  context.read<RegisterViewModel>().changeLockView(),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.4))),
            labelStyle: const TextStyle(color: Colors.black)));
  }

  TextFormField buildPasswordTextFormField(BuildContext context) {
    return TextFormField(
        obscureText: context.watch<RegisterViewModel>().isLockOpen,
        controller: passwordController,
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(Icons.remove_red_eye_outlined),
              onPressed: () =>
                  context.read<RegisterViewModel>().changeLockView(),
            ),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black.withOpacity(0.4))),
            labelStyle: const TextStyle(color: Colors.black)));
  }
}
