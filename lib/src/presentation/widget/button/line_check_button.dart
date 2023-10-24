import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';

class LineCheckButton extends StatelessWidget {
  LineCheckButton({
    Key? key,
    required this.title,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,

    this.selectedBackgroundColor = ColorStyles.blue100,
    this.selectedBorderColor = ColorStyles.blue100,
    this.selectedTextColor = ColorStyles.mainColor,
    this.unselectedBackgroundColor = ColorStyles.white,
    this.unselectedBorderColor = ColorStyles.white400,
    this.unselectedTextColor = ColorStyles.black100,
    this.padding = EdgeInsets.zero,

    required this.isSelected,
    required this.onPressed
  }) : super(key: key);

  final String title;
  final double fontSize;
  final FontWeight fontWeight;

  final Color selectedBackgroundColor;
  final Color selectedBorderColor;
  final Color selectedTextColor;
  final Color unselectedBackgroundColor;
  final Color unselectedBorderColor;
  final Color unselectedTextColor;

  final bool isSelected;

  final EdgeInsets padding;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: CupertinoButton(
        color: ColorStyles.white,
        minSize: 0,
        padding: const EdgeInsets.all(0),
        onPressed: onPressed,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.fromLTRB(10, 6, 10, 6),
          margin: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isSelected ? selectedBackgroundColor : unselectedBackgroundColor,
            border: Border.all(
              color: isSelected ? selectedBorderColor! : unselectedBorderColor!
            )
          ),
          child: Text(
              title,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight,
                  color: isSelected ? selectedTextColor : unselectedTextColor,
                  decoration: null
              )
          ),
        ),
      ),
    );
  }
}
