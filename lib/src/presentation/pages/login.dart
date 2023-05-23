import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mentos_flutter/src/presentation/pages/terms_of_service.dart';
import 'package:mentos_flutter/src/util/enum/SocialType.dart';

import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LonginPage extends StatefulWidget {
  const LonginPage({Key? key}) : super(key: key);

  @override
  State<LonginPage> createState() => _LonginPageState();
}

class _LonginPageState extends State<LonginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset("assets/images/mascot_splash.png"),
              ),
              Column(
                children: [
                  _OnboardingSocialLoginButton(
                    type: SocialLoginType.kakao,
                      onPressed: () async {
                        final talkInstalled = await isKakaoTalkInstalled();
                        final token = talkInstalled
                            ? await UserApi.instance.loginWithKakaoTalk()
                            : await UserApi.instance.loginWithKakaoAccount();
                        print(token.accessToken);
                        await Future.delayed(const Duration(milliseconds: 700));
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => TermsOfServicePage()));
                      }
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  _OnboardingSocialLoginButton(
                      type: SocialLoginType.apple,
                      onPressed: () async {
                        AuthorizationCredentialAppleID token;
                        try {
                          token = await SignInWithApple.getAppleIDCredential(scopes: [
                            AppleIDAuthorizationScopes.email,
                            AppleIDAuthorizationScopes.fullName
                          ]);
                        } catch (e) {
                          print("애플로그인 에러");
                          return;
                        }
                      }
                  ),
                ],
              ),

              const SizedBox(
                height: 36,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _OnboardingSocialLoginButton extends StatelessWidget {
  const _OnboardingSocialLoginButton({
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
            const SizedBox(
              width: 28,
            ),
          ],
        )
      ),
    );
  }
}