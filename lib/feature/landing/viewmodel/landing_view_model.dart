import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:test_pro/feature/landing/service/landing_service.dart';
import 'package:test_pro/feature/register/service/register_service.dart';

class LandingViewModel extends Cubit<LoginState> {
  final LandingService service;

  LandingViewModel({required this.service}) : super(LoginInitial());

  // Future<void> signupEmail() async {
  //   final data = await service.signUpWithEmail(
  //       email: emailController.text.trim(),
  //       password: passwordController.text.trim());
  //   emit(SignUpComplete());
  // }

  Future<void> googleSignIn() async {
    final data = await service.googleLogin();
    emit(LoginComplete());
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
