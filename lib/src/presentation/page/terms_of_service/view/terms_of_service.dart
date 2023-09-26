import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/app/bloc/app_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/main_tab/view/main_tab.dart';
import 'package:mentos_flutter/src/presentation/page/mentor_profile_modify/view/mentor_profile_modify.dart';
import 'package:mentos_flutter/src/presentation/page/terms_of_service/bloc/terms_of_service_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/web_view/view/web_view.dart';
import 'package:mentos_flutter/src/presentation/widget/button/border_line_button.dart';
import 'package:mentos_flutter/src/presentation/widget/button/full_check_button.dart';
import 'package:mentos_flutter/src/presentation/widget/button/full_filled_button.dart';
import 'package:mentos_flutter/src/presentation/widget/view/bottom_dialog_view.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';



class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final termsOfServceBloC = BlocProvider.of<TermsOfServiceBloc>(context);

    return BlocBuilder<TermsOfServiceBloc, TermsOfServiceState>(
      builder: (context, state) => WillPopScope(
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
                        height: 52,
                        title: "[필수] 서비스 이용약관 동의",
                        isSelected: state.isServiceAgree,
                        onPress: () => termsOfServceBloC.add(const TermsOfServicePressedServiceAgree()),
                        rightItem: const _WebLinkButton(
                          webLink: "https://rokwon.notion.site/c213c40b26e4410da8d71621528a43a0",
                          webTitle: "이용약관",
                        ),
                      ),

                      const SizedBox(height: 12),

                      FullCheckButton(
                        height: 52,
                        title: "[필수] 개인정보 수집 및 이용 동의",
                        isSelected: state.isPrivacyAgree,
                        onPress: () => termsOfServceBloC.add(const TermsOfServicePressedPrivacyAgree()),
                        rightItem: const _WebLinkButton(
                          webLink: "https://rokwon.notion.site/954826331e824ef1bd8f19b8c563f99b",
                          webTitle: "개인정보 처리방침",
                        ),
                      ),

                      const SizedBox(height: 12),

                      FullCheckButton(
                        height: 52,
                        title: "[선택] 마케팅 SNS 알림 동의",
                        isSelected: state.isMarketingAgree,
                        onPress: () => termsOfServceBloC.add(const TermsOfServicePressedMarketingAgree()),
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
                      onPressed: state.isServiceAgree && state.isPrivacyAgree ? () {
                        termsOfServceBloC.add(const TermsOfServicePressedStart());
                        showBottomDialog(
                          context: context,
                          title: '💡 커리어 프로필을 작성하시겠어요?',
                          body: '커리어 프로필 작성을 통해\n멘티분들께 신뢰받는 멘토가 되어보세요!',
                          subButtonTitle: '시작하기',
                          subButtonOnPressed: () async {
                            Navigator.pushAndRemoveUntil(
                              context,
                              PageRouteBuilder(
                                pageBuilder: (context, animation1, animation2) => MainTabPage(),
                                transitionDuration: Duration.zero,
                                reverseTransitionDuration: Duration.zero,
                              ),
                              (route) => false
                            );
                          },
                          mainButtonTitle: '작성하기',
                          mainButtonOnPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => MentorProfileModifyPage())
                                ,(route) => false
                            );
                            // 인증 뷰로
                          }
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
        child: const Text(
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
