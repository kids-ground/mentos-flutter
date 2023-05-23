import 'package:flutter/material.dart';

enum SocialLoginType {
  kakao,
  apple;

  String get logo {
    switch (this) {
      case SocialLoginType.apple:
        return 'assets/images/appleLogo.png';
      case SocialLoginType.kakao:
        return 'assets/images/kakaoLogo.png';
    }
  }

  String get loginTitle {
    switch (this) {
      case SocialLoginType.apple:
        return 'Apple로 계속하기';
      case SocialLoginType.kakao:
        return '카카오톡으로 계속하기';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case SocialLoginType.apple:
        return Color(0xFF000000);
      case SocialLoginType.kakao:
        return Color(0xFFffd400);
    }
  }

  Color get titleColor {
    switch (this) {
      case SocialLoginType.apple:
        return Colors.white;
      case SocialLoginType.kakao:
        return Colors.black;
    }
  }
}