import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LengthPicker extends StatelessWidget {
  LengthPicker({Key? key}) : super(key: key);
  final List<int> list = [for (var i = 1; i <= 250; i++) i];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("How much is your length?"),
          SizedBox(height: 40),
          Row(
            children: [
              SizedBox(
                height: 200,
                width: 250,
                child: CupertinoPicker(
                  itemExtent: 64,
                  children: list.map((item) => Text(item.toString())).toList(),
                  onSelectedItemChanged: (index) {},
                ),
              ),
              SizedBox(
                height: 200,
                width: 100,
                child: CupertinoPicker(
                  itemExtent: 64,
                  children: [
                    Text("cm"),
                    Text("ft"),
                  ],
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
