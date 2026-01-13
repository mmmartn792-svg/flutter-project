import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const Custombutton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: Colors.white,
      color: Colors.green,
      height: 55,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(77),
      ),
      child: Text(title),
    );
  }
}
