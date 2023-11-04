import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';
import 'package:mentos_flutter/src/presentation/style/text_style.dart';

class BorderLineButton extends StatelessWidget {
  const BorderLineButton({
    Key? key,
    required this.title,
    this.fontSize = 18,
    this.fontWeight = FontWeight.w500,
    this.color = const Color(0xFF1F5CD1), // mainColor
    this.width = double.infinity,
    this.height = double.infinity,
    this.textStyle,
    required this.onPressed
  }) : super(key: key);

  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final double width;
  final double height;
  final Function()? onPressed;
  final TextStyle? textStyle;


  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.all(0),
      disabledColor: Colors.transparent,
      onPressed: onPressed,
      minSize: 0,

      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: onPressed == null ? black700 : white1000,
              width: 0.5
            )
        ),
        child: Text(title,
            style: textStyle ?? customColorTextStyle(primaryB1, color)
        ),
      ),
    );
  }
}
