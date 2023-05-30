import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/app_bar.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: '설정',),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          color: ColorStyles.white200,
          child: Text(
            '설정은 만들어야합니다',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorStyles.black100
            ),
          ),
        ),
      ),
    );
  }
}
