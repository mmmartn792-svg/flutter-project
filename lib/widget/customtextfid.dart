import 'package:flutter/material.dart';

class Customtextform extends StatelessWidget {
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  Customtextform({
    super.key,
    required this.hint,
    this.controller,
    this.validator,
    this.onChanged,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        filled: true,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: const Color.fromARGB(66, 100, 11, 11)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
