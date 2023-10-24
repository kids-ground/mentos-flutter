
// kakao Native App Key
import 'package:flutter_dotenv/flutter_dotenv.dart';

final String kakaoNativeAppKey = dotenv.env['KAKAO_NATIVE_APP_KEY'] ?? '';
final String baseUrl = dotenv.env['API_BASE_URL'] ?? '';

// Pattern
const emailPattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
const kakaoOpenChatLinkPattern = r'^https:\/\/open\.kakao\.com\/[^/]+\/[^/]+$';

// Constant
const appTitle = '멘토스';
const fontFamilyName = 'Pretendard';
const List<String> jobGroupList = <String>['개발', '디자인', '마케팅', '인사'];