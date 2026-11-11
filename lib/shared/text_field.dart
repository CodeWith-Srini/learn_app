import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  const CTextField({super.key, required this.labelText});

  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),

        labelText: labelText,

        alignLabelWithHint: true,
      ),
    );
  }
}
