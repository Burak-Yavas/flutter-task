import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgePicker extends StatelessWidget {
  AgePicker({Key? key}) : super(key: key);

  final List<int> list = [for (var i = 1; i <= 100; i++) i];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("How old are you?"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 400,
                width: 200,
                child: CupertinoPicker(
                  itemExtent: 54,
                  children: list.map((item) => Text(item.toString())).toList(),
                  onSelectedItemChanged: (index) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
