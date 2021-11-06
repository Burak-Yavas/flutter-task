import 'package:flutter/material.dart';

class GenderPicker extends StatefulWidget {
  GenderPicker({Key? key}) : super(key: key);

  @override
  State<GenderPicker> createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  bool isManPressed = false;
  bool isWomanPressed = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          const Text("What is your sex?"),
          const Spacer(
            flex: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildWomanCard(),
              buildManCard(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [Text("Woman"), Text("Man")],
          ),
          const Spacer(flex: 3)
        ],
      ),
    );
  }

  Card buildWomanCard() {
    return Card(
        child: GestureDetector(
      onTap: () {
        setState(() {
          isWomanPressed = !isWomanPressed;
        });
      },
      child: Container(
        foregroundDecoration: BoxDecoration(
          color: isWomanPressed ? null : Colors.grey,
          backgroundBlendMode: isWomanPressed ? null : BlendMode.saturation,
        ),
        width: 150,
        height: 150,
        child: buildImageSizedBox("assets/images/woman_png.png"),
      ),
    ));
  }

  Widget buildManCard() {
    return Card(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isManPressed = !isManPressed;
          });
          print("pressed");
        },
        child: Container(
          foregroundDecoration: BoxDecoration(
            color: isManPressed ? null : Colors.grey,
            backgroundBlendMode: isManPressed ? null : BlendMode.saturation,
          ),
          width: 150,
          height: 150,
          child: buildImageSizedBox("assets/images/man_png.png"),
        ),
      ),
    );
  }

  SizedBox buildImageSizedBox(String path) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Image.asset(
        path,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
