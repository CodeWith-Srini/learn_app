import 'package:flutter/material.dart';

class TwoDButton extends StatefulWidget {
  const TwoDButton({super.key, required this.iconnew});

  final IconData iconnew;

  @override
  State<TwoDButton> createState() => _TwoDButtonState();
}

class _TwoDButtonState extends State<TwoDButton> {
  bool isPress = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isPress = true),
      onTapUp: (_) => setState(() => isPress = false),
      onTapCancel: () => setState(() => isPress = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(10),
        transform: Matrix4.translationValues(
          isPress ? 3 : 0,
          isPress ? 3 : 0,
          0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurRadius: 0,
              offset: isPress ? const Offset(0, 0) : const Offset(3, 3),
            ),
          ],
        ),
        child: Icon(widget.iconnew, color: Colors.black, size: 22),
      ),
    );
  }
}
