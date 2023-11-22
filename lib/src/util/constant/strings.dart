
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String kakaoNativeAppKey = dotenv.env['KAKAO_NATIVE_APP_KEY'] ?? '';
// debug 모드 일때 ifconfig로 ip 찾은 후 적용할 것
final String baseUrl = kDebugMode ? 'http://172.30.36.143:8080' : dotenv.env['API_BASE_URL']!;

// Pattern
const emailPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const kakaoOpenChatLinkPattern = r'^https:\/\/open\.kakao\.com\/[^/]+\/[^/]+$';

// Constant
const appTitle = '멘토스';
const List<String> jobGroupList = <String>['개발', '디자인', '마케팅', '인사'];

const fontFamilyName = 'Pretendard';
const variableFontFamilyName = 'PretendardVariable';
