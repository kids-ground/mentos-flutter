
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/page/app/bloc/app_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/login/bloc/login_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/main_tab/view/main_tab.dart';
import 'package:mentos_flutter/src/presentation/page/terms_of_service/view/terms_of_service_page.dart';
import 'package:mentos_flutter/src/presentation/widget/app_bar/app_bar.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';
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
      backgroundColor: ColorStyles.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/images/background_logo.png"),
              opacity: 0.5
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ME",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: ColorStyles.black1000,
                    ),
                  ),
                  Text(
                    "n",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      color: ColorStyles.black1000,
                    ),
                  ),
                  Text(
                    "T",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                      color: ColorStyles.black1000,
                    ),
                  ),
                  Text(
                    "os",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.w400,
                      color: ColorStyles.black1000,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12,),
              Text(
                "' 멘토와 멘티의 만남 '",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorStyles.black300,
                ),
              ),
              const SizedBox(height: 160,),

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
              SizedBox(height: 24,)
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
      height: 52,
      child: CupertinoButton(
        borderRadius: BorderRadius.circular(8),
        color: ColorStyles.blueGrey100,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              type.logo,
              width: 18,
              height: 18,
            ),
            const SizedBox(width: 8,),
            Text(
              type.loginTitle,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: ColorStyles.black800,
              ),
            ),
          ],
        )
      ),
    );
  }
}