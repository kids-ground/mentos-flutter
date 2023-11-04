import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';
import 'package:mentos_flutter/src/presentation/style/text_style.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.bottomLine = true,
    this.centerTitle = false,
    this.fontSize = 24,
    this.fontWeight = FontWeight.w700,
    this.leadingWidth
  }) : preferredSize = const Size.fromHeight(42), super(key: key);

  @override
  final Size preferredSize;

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool bottomLine;
  final bool centerTitle;
  final double fontSize;
  final FontWeight fontWeight;
  final double? leadingWidth;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      shape: bottomLine ? const Border(
        bottom: BorderSide(
          color: white1000,
          width: 0.1,
        ),
      ) : null,
      centerTitle: centerTitle,
      title: title != null ? Text(title!, style: fontSize == 24 ? primaryT1 : primaryB1,) : null,
      titleSpacing: 24,
      leading: leading != null ? Container(
        margin: const EdgeInsets.fromLTRB(24, 8, 0, 8),
        child: leading,
      ) : null,
      leadingWidth: leadingWidth,
      actions: actions,
      elevation: 0.1,
    );
  }
}
