import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';

class FullFilledButton extends StatelessWidget {
  const FullFilledButton({
    Key? key,
    required this.title,
    this.fontSize = 18,
    this.backgroundColor = const Color(0xFF1F5CD1),
    this.fontColor = const Color(0xFFFFFFFF),
    this.width = double.infinity,
    this.height = double.infinity,
    required this.onPressed
  }) : super(key: key);

  final String title;
  final double fontSize;
  final Color backgroundColor;
  final Color fontColor;
  final double width;
  final double height;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: backgroundColor,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w500,
            color: fontColor,
          )
        ),
      ),
    );
  }
}
