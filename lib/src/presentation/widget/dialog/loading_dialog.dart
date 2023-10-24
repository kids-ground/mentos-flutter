import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const Dialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          child: CupertinoActivityIndicator(
            radius: 20,
            color: ColorStyles.white,
          )
      );
    },
  );
}

void showSimpleSnackBar(BuildContext context, String text) {
  SnackBar snackBar = SnackBar(
    content: Text(text),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.up,
    duration: const Duration(milliseconds: 2000),
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 200,
        left: 10,
        right: 10),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}