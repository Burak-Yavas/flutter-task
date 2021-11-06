import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserViewModel extends Cubit<PageState> {
  int? currentIndex;
  final PageController controller;

  UserViewModel(this.controller) : super(PageInitial());

  void minusCurrentIndex() {
    if (currentIndex != null) {
      currentIndex = currentIndex! - 1;
      emit(PageMinus());
    }
  }

  void plusCurrentIndex() {
    if (currentIndex != null) {
      currentIndex = currentIndex! + 1;
      emit(PagePlus());
      emit(PageIndex());
    }
  }

  void changeCurrentIndex(int value) {
    currentIndex = value;
    emit(PageIndex());
  }
}

abstract class PageState {}

class PageInitial extends PageState {}

class PageIndex extends PageState {
  PageIndex();
}

class PagePlus extends PageState {
  PagePlus();
}

class PageMinus extends PageState {
  PageMinus();
}
