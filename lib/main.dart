import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:mentos_flutter/src/presentation/page/app/view/app.dart';
import 'package:mentos_flutter/src/util/constant/strings.dart';

void main() {
  // 기반 설정
  KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);
  runApp(const App());
}