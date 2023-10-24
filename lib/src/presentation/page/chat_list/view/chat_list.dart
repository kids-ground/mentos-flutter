import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/app_bar.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';

class ChatListPage extends StatelessWidget {
  const ChatListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: '채팅',),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          color: ColorStyles.white200,
          child: Text(
            '채팅 내역이 없습니다.',
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
