import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/page/web_view/view/web_view.dart';
import 'package:mentos_flutter/src/presentation/widget/button/border_line_button.dart';
import 'package:mentos_flutter/src/presentation/widget/button/full_check_button.dart';
import 'package:mentos_flutter/src/presentation/widget/button/full_filled_button.dart';
import 'package:mentos_flutter/src/presentation/widget/view/bottom_dialog_view.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';

class TermsOfServicePage extends StatefulWidget {
  const TermsOfServicePage({Key? key}) : super(key: key);

  @override
  State<TermsOfServicePage> createState() => _TermsOfServicePageState();
}

class _TermsOfServicePageState extends State<TermsOfServicePage> {
  bool button1Selected = true;
  bool button2Selected = true;
  bool button3Selected = true;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/mentos.png",
                      width: 70,
                    ),
                    const SizedBox(height: 24),

                    Text(
                      "환영합니다!\n이용약관에 동의해주세요",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: ColorStyles.black1000),
                    ),
                    const SizedBox(height: 16),

                    Text(
                      "원활한 서비스 이용을 위해\n이용 약관 및 개인정보 수집 동의가 필요해요.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ColorStyles.black200),
                    ),
                    const SizedBox(height: 48),

                    FullCheckButton(
                      width: width,
                      height: 52,
                      title: "[필수] 서비스 이용약관 동의",
                      isSelected: button1Selected,
                      onPress: () => setState(() {
                        button1Selected = !button1Selected;
                      }),
                      rightItem: const _WebLinkButton(
                        webLink: "https://rokwon.notion.site/c213c40b26e4410da8d71621528a43a0",
                        webTitle: "이용약관",
                      ),
                    ),

                    const SizedBox(height: 12),

                    FullCheckButton(
                        width: width,
                        height: 52,
                        title: "[필수] 개인정보 수집 및 이용 동의",
                        isSelected: button2Selected,
                        onPress: () => setState(() {
                          button2Selected = !button2Selected;
                        }),
                        rightItem: const _WebLinkButton(
                          webLink: "https://rokwon.notion.site/954826331e824ef1bd8f19b8c563f99b",
                          webTitle: "개인정보 처리방침",
                        ),
                    ),

                    const SizedBox(height: 12),

                    FullCheckButton(
                      width: width,
                      height: 52,
                      title: "[선택] 마케팅 SNS 알림 동의",
                      isSelected: button3Selected,
                      onPress: () => setState(() {
                        button3Selected = !button3Selected;
                      }),
                      rightItem: const _WebLinkButton(
                        webLink: "https://rokwon.notion.site/1a3bb5b56b804293b256b056e7514bcc",
                        webTitle: "마케팅 수신 동의",
                      ),
                    )
                  ],
                ),

                Container(
                  width: double.infinity,
                  height: 56,
                  child: CupertinoButton(
                    disabledColor: ColorStyles.white700,
                    borderRadius: BorderRadius.circular(16),
                    color: ColorStyles.mainColor,
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                    onPressed: button1Selected && button2Selected ? () {
                      showBottomDialog(
                        context: context,
                        title: '💡 멘토로 등록하시겠어요?',
                        body: '회원가입이 완료되었습니다.\n멘토 등록을 원하신다면 등록하기를 눌러주세요.\n',
                        subButtonTitle: '시작하기',
                        subButtonOnPressed: () { },
                        mainButtonTitle: '등록하기',
                        mainButtonOnPressed: () { }
                      );
                    } : null,
                    child: const Text(
                      "동의하고 시작하기",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                      )
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/*
  AgreeButton
 */
class _WebLinkButton extends StatelessWidget {
  const _WebLinkButton({
    Key? key,
    required this.webLink,
    required this.webTitle
  }) : super(key: key);

  final String webLink;
  final String webTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (){
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => WebViewPage(webLink: webLink, title: webTitle,),
            )
        );
      },
      child: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          child: Text(
              "확인",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: ColorStyles.black100,
                  decorationThickness: 1,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorStyles.black100
              )
          )
      ),
    );
  }
}
