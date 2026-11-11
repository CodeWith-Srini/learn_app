import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PressableButton extends StatefulWidget {
  PressableButton({super.key, required this.isPress, required this.title});
  bool isPress;
  String title;

  @override
  State<PressableButton> createState() => _PressableButtonState();
}

class _PressableButtonState extends State<PressableButton> {
  void onPressDown(TapDownDetails details) {
    setState(() {
      widget.isPress = true;
    });
  }

  void onPressUp(TapUpDetails details) {
    setState(() {
      widget.isPress = false;
    });
  }

  void onPressCancel() {
    setState(() {
      widget.isPress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onPressDown,
      onTapUp: onPressUp,
      onTapCancel: onPressCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        transform: Matrix4.translationValues(
          widget.isPress ? 5 : 0,
          widget.isPress ? 5 : 0,
          0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: widget.isPress ? Offset.zero : const Offset(5, 5),
            ),
          ],
        ),
        child: Text(widget.title, textAlign: TextAlign.center),
      ),
    );
  }
}
