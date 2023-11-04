import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/app/bloc/app_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/mentor_profile_modify/view/mentor_profile_modify_page.dart';
import 'package:mentos_flutter/src/presentation/page/terms_of_service/bloc/terms_of_service_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/web_view/view/web_view.dart';
import 'package:mentos_flutter/src/presentation/widget/button/full_check_button.dart';
import 'package:mentos_flutter/src/presentation/widget/view/bottom_dialog_view.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';
import 'package:mentos_flutter/src/util/enum/mentos_enum.dart';


class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => TermsOfServiceBloc(),
        child: const TermsOfServicePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const _TermsOfServiceView();
  }
}

class _TermsOfServiceView extends StatelessWidget {
  const _TermsOfServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TermsHeader(),
                      SizedBox(height: 48),
                      _TermsButtonGroup()
                    ],
                  ),

                  _TermsSaveButton()
                ],
              ),
            ),
          ),
        ),
      );
  }
}

class _TermsHeader extends StatelessWidget {
  const _TermsHeader({Key? key}) : super(key: key);

  final String titleImagePath = 'assets/images/mentos.png';
  final String mainTitle = '환영합니다!\n이용약관에 동의해주세요';
  final String description = '원활한 서비스 이용을 위해\n이용 약관 및 개인정보 수집 동의가 필요해요.';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(titleImagePath, width: 70,),
        const SizedBox(height: 24),
        Text(
          mainTitle,
          style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: black1000),
        ),
        const SizedBox(height: 16),
        Text(
          description,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: black200),
        ),
      ],
    );
  }
}

class _TermsButtonGroup extends StatelessWidget {
  const _TermsButtonGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsOfServiceBloc, TermsOfServiceState>(
      buildWhen: (pre, cur) => pre.termsAgree != cur.termsAgree,
      builder: (context, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: TermsOfServiceType.values.map<Widget>((v) =>
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FullCheckButton(
                  height: 52,
                  title: v.title,
                  isSelected: state.isAgree(v),
                  onPress: () => context.read<TermsOfServiceBloc>().add(TermsOfServicePressedAgree(type: v)),
                  rightItem: buildWebLinkButton(context: context, link: v.webLink, linkTitle: v.webLinkTitle)
                ),
                const SizedBox(height: 12),
              ],
            )
        ).toList(),
      ),
    );
  }

  Widget buildWebLinkButton({
    required BuildContext context,
    required String link,
    required String linkTitle
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.push(context, WebViewPage.route(title: linkTitle, link: link)),
      child: Container(
          width: 30,
          height: 30,
          alignment: Alignment.center,
          child: const Text(
              '확인',
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: black100,
                  decorationThickness: 1,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: black100
              )
          )
      ),
    );
  }
}

class _TermsSaveButton extends StatelessWidget {
  const _TermsSaveButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsOfServiceBloc, TermsOfServiceState>(
      builder: (context, state) => SizedBox(
        width: double.infinity,
        height: 56,
        child: CupertinoButton(
            disabledColor: white700,
            borderRadius: BorderRadius.circular(16),
            color: mainColor,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            onPressed: state.requiredAllAgree ? () => onPressedSaveButton(context) : null,
            child: const Text(
                '동의하고 시작하기',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                )
            )
        ),
      ),
    );
  }

  void onPressedSaveButton(BuildContext context) {
    showBottomDialog(
      context: context,
      title: '💡 커리어 프로필을 작성하시겠어요?',
      body: '커리어 프로필 작성을 통해\n멘티분들께 신뢰받는 멘토가 되어보세요!',
      subButtonTitle: '시작하기',
      subButtonOnPressed: () async {
        context.read<TermsOfServiceBloc>().add(const TermsOfServicePressedStart());
        context.read<AppBloc>().add(const AppChangeStatus(appStaus: AppStatus.joined));
        Navigator.pop(context);
      },
      mainButtonTitle: '작성하기',
      mainButtonOnPressed: () async {
        context.read<TermsOfServiceBloc>().add(const TermsOfServicePressedStart());
        context.read<AppBloc>().add(const AppChangeStatus(appStaus: AppStatus.joined));
        Navigator.pushReplacement(context, MentorProfileModifyPage.route());
      }
    );
  }
}