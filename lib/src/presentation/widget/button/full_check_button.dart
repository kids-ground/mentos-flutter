import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';

class FullCheckButton extends StatelessWidget {
  FullCheckButton({
    Key? key,
    this.width = double.infinity,
    this.height = double.infinity,
    required this.title,
    required this.isSelected,
    required this.onPress,
    this.rightItem
  }) : super(key: key);

  final double width;
  final double height;
  final String title;
  final bool isSelected;
  final Function() onPress;
  Widget? rightItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: isSelected ? ColorStyles.white : ColorStyles.white300,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(
                      color: isSelected ? ColorStyles.mainColor : ColorStyles.white300,
                      width: 1
                  )
              )
          ),
          onPressed: onPress,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.check,
                    color: isSelected ? ColorStyles.mainColor : ColorStyles.white1000,
                    size: 24,
                  ),
                  const SizedBox(width: 12),
                  Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isSelected ? ColorStyles.mainColor : ColorStyles.black100,
                      )
                  ),
                ],
              ),
              rightItem ?? Container()
            ],
          )
      ),
    );
  }
}