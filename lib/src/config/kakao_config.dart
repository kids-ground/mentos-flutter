import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:mentos_flutter/src/util/constant/strings.dart';

void setupKakaoSDK() {
  KakaoSdk.init(nativeAppKey: kakaoNativeAppKey);
}