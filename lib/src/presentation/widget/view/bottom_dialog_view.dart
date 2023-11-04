import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/style/text_style.dart';
import 'package:mentos_flutter/src/presentation/widget/button/border_line_button.dart';
import 'package:mentos_flutter/src/presentation/widget/button/full_filled_button.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';


void showBottomDialog({
  required BuildContext context,
  required String title,
  String body = "",
  String? subButtonTitle,
  required String mainButtonTitle,
  Function()? subButtonOnPressed,
  required Function() mainButtonOnPressed,
  bool? barrierDismissible
}) {
  showGeneralDialog(
    barrierLabel: "Label",
    barrierDismissible: barrierDismissible ?? true,
    barrierColor: Colors.black.withOpacity(0.8),
    transitionDuration: const Duration(milliseconds: 300),
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return BottomDialogView(
        title: title,
        body: body,
        subButtonTitle: subButtonTitle,
        subButtonOnPressed: subButtonOnPressed,
        mainButtonTitle: mainButtonTitle,
        mainButtonOnPressed: mainButtonOnPressed
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return SlideTransition(
        position: Tween(
            begin: const Offset(0, 1),
            end: const Offset(0, 0)
        ).animate(CurvedAnimation(parent: anim1, curve: Curves.easeOutCirc)),
        child: child,
      );
    },
  );

}

class BottomDialogView extends StatelessWidget {
  const BottomDialogView({
    Key? key,
    required this.title,
    this.body = "",
    this.subButtonTitle,
    required this.mainButtonTitle,
    this.subButtonOnPressed,
    required this.mainButtonOnPressed
  }) : super(key: key);

  final String title;
  final String body;
  final String? subButtonTitle;
  final String mainButtonTitle;
  final Function()? subButtonOnPressed;
  final Function() mainButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyLarge!,
      child: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
            decoration: BoxDecoration(
              color: black600,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: primaryT2),
                  const SizedBox(height: 20),
                  Text(body, style: primaryB1),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      if (subButtonOnPressed != null)
                        ...[
                          Expanded(
                            child: BorderLineButton(
                                title: subButtonTitle ?? "",
                                height: 56,
                                onPressed: () {
                                  Navigator.pop(context);
                                  subButtonOnPressed!();
                                }
                            )
                          ),
                          const SizedBox(width: 8,),
                        ],

                      Expanded(
                          child: FullFilledButton(
                              title: mainButtonTitle,
                              height: 56,
                              onPressed: () {
                                Navigator.pop(context);
                                mainButtonOnPressed();
                              }
                          )
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );;
  }
}
