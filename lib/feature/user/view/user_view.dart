import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pro/core/components/avatar/circle_avatar.dart';
import 'package:test_pro/feature/user/view/subpages/age_picker.dart';
import 'package:test_pro/feature/user/view/subpages/gender_picker.dart';
import 'package:test_pro/feature/user/view/subpages/length_picker.dart';
import 'package:test_pro/feature/user/view/subpages/weight_picker.dart';
import 'package:test_pro/feature/user/viewmodel/user_view_model.dart';
import 'package:flutter/cupertino.dart';

class UserView extends StatelessWidget {
  UserView({Key? key}) : super(key: key);
  final PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserViewModel(pageController),
      child: BlocConsumer<UserViewModel, PageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              appBar: buildAppBar(context), body: buildCenter(context));
        },
      ),
    );
  }

  Center buildCenter(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 4),
          SizedBox(height: 450, child: buildPageView(context)),
          const Spacer(flex: 3),
          buildNextTextButton(context),
          const Spacer(flex: 1),
          Expanded(flex: 4, child: buildCircleListView()),
          const Spacer(flex: 2)
        ],
      ),
    );
  }

  PageView buildPageView(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        context.read<UserViewModel>().changeCurrentIndex(index);
      },
      children: [GenderPicker(), AgePicker(), LengthPicker(), WeightPicker()],
    );
  }

  TextButton buildNextTextButton(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            fixedSize: const Size(300, 10),
            backgroundColor: Colors.blue[900],
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        child: const Text(
          "Next",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          context.read<UserViewModel>().plusCurrentIndex();
          pageController.nextPage(
              duration: const Duration(seconds: 1), curve: Curves.easeIn);
        });
  }

  ListView buildCircleListView() {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(7),
              child: ListViewCircleAvatar(
                  isSelected:
                      context.watch<UserViewModel>().currentIndex == index));
        });
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: buildImageSizedBox(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          context.read<UserViewModel>().plusCurrentIndex();
          pageController.previousPage(
              duration: const Duration(seconds: 1), curve: Curves.easeIn);
        },
        icon: const Icon(Icons.arrow_back_ios_new),
        color: Colors.black,
      ),
    );
  }

  Widget buildImageSizedBox() {
    return SizedBox(
      height: 200,
      width: 200,
      child: Image.asset(
        "assets/images/fitness.png",
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
