import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/app_bar.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';

class MentorListPage extends StatelessWidget {
  const MentorListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: '멘토',
        actions: [
          IconButton(
            onPressed: () { },
            padding: const EdgeInsets.fromLTRB(24, 9, 24, 9),
            icon: Image.asset(
                "assets/images/plus.png",
                color: ColorStyles.black700
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          color: ColorStyles.white200,
          child: Text(
            '등록된 멘토가 없습니다.',
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
