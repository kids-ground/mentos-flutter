import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';

class FilledTagView extends StatelessWidget {
  const FilledTagView({
    Key? key,
    required this.title,
    this.backgroundColor = blue100,
    this.fontColor = blue1000,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400
  }) : super(key: key);

  final String title;
  final Color backgroundColor;
  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: backgroundColor
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: fontColor
        ),
      ),
    );
  }
}
