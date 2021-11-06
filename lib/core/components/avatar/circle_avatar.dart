import 'package:flutter/material.dart';

class ListViewCircleAvatar extends StatelessWidget {
  const ListViewCircleAvatar({Key? key, required this.isSelected})
      : super(key: key);
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(7),
        child: CircleAvatar(
          backgroundColor: Colors.black.withOpacity(isSelected ? 1 : 0.2),
          radius: isSelected ? 5 : 3,
        ));
  }
}
