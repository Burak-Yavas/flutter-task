import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../service/register_service.dart';

class RegisterViewModel extends Cubit<LoginState> {
  final RegisterService service;

  final TextEditingController nameController;

  final TextEditingController emailController;

  final TextEditingController passwordController;

  final TextEditingController? reWritePasswordController;

  bool isLockOpen = false;

  RegisterViewModel(
      this.nameController, this.emailController, this.passwordController,
      {required this.service, this.reWritePasswordController})
      : super(LoginInitial());

  Future<void> signUpEmail() async {
    if (reWritePasswordController!.text == passwordController.text) {
      final data = await service.signUpWithEmail(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      emit(SignUpComplete());
    }

    // final data = await service.signUpWithEmail(
    //     email: emailController.text.trim(),
    //     password: passwordController.text.trim());
    // emit(SignUpComplete());
  }

  Future<void> signInEmail() async {
    final data = await service.loginWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    emit(SignInComplete());
  }

  void changeLockView() {
    isLockOpen = !isLockOpen;
    emit(LoginLockState(isLockOpen));
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginComplete extends LoginState {
  LoginComplete();
}

class SignUpComplete extends LoginState {
  SignUpComplete();
}

class SignInComplete extends LoginState {
  SignInComplete();
}

class LoginLockState extends LoginState {
  final bool isLockOpen;
  LoginLockState(this.isLockOpen);
}
