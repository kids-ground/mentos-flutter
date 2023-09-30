import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/page/app/bloc/app_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/login/bloc/login_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/main_tab/view/main_tab.dart';
import 'package:mentos_flutter/src/presentation/page/terms_of_service/view/terms_of_service_page.dart';
import 'package:mentos_flutter/src/util/color/color_style.dart';
import 'package:mentos_flutter/src/util/enum/social_type.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => LoginBloc(),
        child: const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (pre, cur) => pre.status != cur.status,
      listener: (context, state) {
        switch (state.status) {
          case LoginStatus.signIn:
            context.read<AppBloc>().add(const AppChangeStatus(appStaus: AppStatus.joined));
          case LoginStatus.signUp:
            Navigator.push(context, TermsOfServicePage.route());
          case LoginStatus.failure: // 실패 Toast 띄우기
          default:
            return;
        }
      },
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginBloC = BlocProvider.of<LoginBloc>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  "assets/images/mentos.png",
                  width: 180,
                )
              ),
              Column(
                children: [
                  _SocialLoginButton(
                      type: SocialLoginType.kakao,
                      onPressed: () => loginBloC.add(const LoginPressedKakaoLoginEvent())
                  ),
                  const SizedBox(height: 12),
                  _SocialLoginButton(
                      type: SocialLoginType.apple,
                      onPressed: () => loginBloC.add(const LoginPressedAppleLoginEvent())
                  ),
                ],
              ),
              const SizedBox(height: 36),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialLoginButton extends StatelessWidget {
  const _SocialLoginButton({
    Key? key,
    required this.type,
    required this.onPressed
  }) : super(key: key);

  final SocialLoginType type;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      width: width - 32,
      height: 52,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(16),
        color: type.backgroundColor,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              type.logo,
              width: 28,
              height: 28,
            ),
            Text(
              type.loginTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: type.titleColor,
              ),
            ),
            const SizedBox(width: 28),
          ],
        )
      ),
    );
  }
}