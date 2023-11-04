
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/page/app/bloc/app_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/login/bloc/login_bloc.dart';
import 'package:mentos_flutter/src/presentation/page/terms_of_service/view/terms_of_service_page.dart';
import 'package:mentos_flutter/src/presentation/style/text_style.dart';
import 'package:mentos_flutter/src/presentation/style/color_style.dart';
import 'package:mentos_flutter/src/util/constant/strings.dart';
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
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     alignment: Alignment.topCenter,
          //     fit: BoxFit.fitWidth,
          //     image: AssetImage("assets/images/background_logo.png"),
          //     opacity: 0.5
          //   )
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              _TitleView(),
              const SizedBox(height: 100,),
              Column(
                children: [
                  const _KakaoLoginButton(),
                  const SizedBox(height: 16),
                  const _AppleLoginButton()
                ],
              ),
              Spacer(),
              TermsServiceView(),
              SizedBox(height: 16,),
            ],
          ),
        ),
      ),
    );
  }
}

class _TitleView extends StatelessWidget {
  const _TitleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "' 커리어 멘토가 필요할 때 '",
          style: primaryT2,
        ),
        // SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/mentos.png', width: 70, height: 70,),
            const SizedBox(width: 8,),
            Text("멘토스", style: logoH0,),
          ],
        ),
      ],
    );
  }
}

class _KakaoLoginButton extends StatelessWidget {
  const _KakaoLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        borderRadius: BorderRadius.circular(8),
        padding: const EdgeInsets.all(0),
        color: Colors.transparent,
        minSize: 0,
        onPressed: () => context.read<LoginBloc>().add(const LoginPressedKakaoLoginEvent()),
        child: Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 1,
                color: Colors.yellow,
              )
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              const Center(
                child: Text(
                  '카카오톡 로그인',
                  style: primaryB1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Image.asset("assets/images/kakaoLogo.png",),
                ),
              ),
            ],
          ),
        )
    );
  }
}

class _AppleLoginButton extends StatelessWidget {
  const _AppleLoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        borderRadius: BorderRadius.circular(8),
        padding: const EdgeInsets.all(0),
        color: Colors.transparent,
        minSize: 0,
        onPressed: () => context.read<LoginBloc>().add(const LoginPressedAppleLoginEvent()),
        child: Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                  width: 1,
                  color: white1000
              )
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              const Center(
                child: Text(
                  '애플 로그인',
                  style: primaryB1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(16)
                  ),
                  child: Image.asset("assets/images/appleLogo.png"),
                ),
              ),
            ],
          ),
        )
    );
  }
}

class TermsServiceView extends StatelessWidget {
  const TermsServiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('이용약관', style: TextStyle(
            fontFamily: variableFontFamilyName,
            color: white,
            fontSize: 15,
            fontVariations: [
              FontVariation('wght', 400),
            ],
            decoration: TextDecoration.underline,
          ),),
          SizedBox(width: 12,),
          Text('개인정보처리방침', style: TextStyle(
            fontFamily: variableFontFamilyName,
            color: white,
            fontSize: 15,
            fontVariations: [
              FontVariation('wght', 400),
            ],
            decoration: TextDecoration.underline,
          ),),
        ],
      ),
    );
  }
}