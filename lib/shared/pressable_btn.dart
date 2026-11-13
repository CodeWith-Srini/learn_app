import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PressableButton extends StatefulWidget {
  const PressableButton({
    super.key,
    this.title,
    this.onPressed,
    this.iconnew,
    this.iconsize,
    required this.width,
    required this.padding,
  });

  final String? title;
  final VoidCallback? onPressed;
  final IconData? iconnew;
  final double? iconsize;
  final double? width;
  final double padding;

  @override
  State<PressableButton> createState() => _PressableButtonState();
}

class _PressableButtonState extends State<PressableButton> {
  bool isPress = false;
  void onPressDown(TapDownDetails details) {
    setState(() {
      isPress = true;
    });
  }

  void onPressUp(TapUpDetails details) {
    setState(() {
      isPress = false;
    });
  }

  void onPressCancel() {
    setState(() {
      isPress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onPressDown,
      onTapUp: onPressUp,
      onTapCancel: onPressCancel,
      onTap: widget.onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        width: widget.width,
        padding: EdgeInsets.all(widget.padding),
        transform: Matrix4.translationValues(
          isPress ? 5 : 0,
          isPress ? 5 : 0,
          0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: isPress ? Offset.zero : const Offset(5, 5),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (widget.iconnew != null)
              Icon(widget.iconnew, color: Colors.black, size: widget.iconsize),
            if (widget.title != null)
              Text(widget.title!, textAlign: TextAlign.center),
          ],
        ),

        // child:
        //     widget.iconnew != null
        //         ? Icon(widget.iconnew, color: Colors.black, size: 22)
        //         : Text(widget.title!, textAlign: TextAlign.center),
      ),
    );
  }
}
