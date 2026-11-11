import 'dart:developer';

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.label,
    required this.isMobile,
    required this.isPassword,
    required this.controller,
  });

  final String label;
  final bool isMobile;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool eyepass = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(
        color: Colors.black,
        // color: !widget.isMobile ? Colors.black : Colors.white,
        fontSize: 16,
        letterSpacing: widget.isPassword ? 10 : 0,
      ),
      obscureText: widget.isPassword ? eyepass : false,

      decoration: InputDecoration(
        // labelText: widget.label,
        hintText: widget.label,
        hintStyle: TextStyle(letterSpacing: 0),
        suffixIcon:
            widget.isPassword
                ? InkWell(
                  onTap: () {
                    setState(() {
                      eyepass = !eyepass;
                    });
                    log('message $eyepass');
                  },
                  child: Icon(
                    !eyepass
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                )
                : null,

        labelStyle: TextStyle(
          color: !widget.isMobile ? Colors.blueAccent : Colors.black,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2),
        ),
        errorStyle: const TextStyle(height: 0.0, fontSize: 0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            // color: !widget.isMobile ? Colors.black : Colors.white,
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return '';
        }
        return null;
      },
    );
  }
}
