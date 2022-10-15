import 'package:flutter/material.dart';
import 'package:ybm/meta/utils/constants.dart';

class AddFloatingActionButton extends StatelessWidget {
  const AddFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: Container(
        height: 66,
        width: 66,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: gradientColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 50,
              spreadRadius: 10,
              color: secondaryColor.withOpacity(0.1),
            )
          ],
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
