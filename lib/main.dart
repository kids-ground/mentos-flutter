import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:mentos_flutter/src/config/bloc_config.dart';
import 'package:mentos_flutter/src/config/di_config.dart';
import 'package:mentos_flutter/src/config/firebase_config.dart';
import 'package:mentos_flutter/src/config/kakao_config.dart';
import 'package:mentos_flutter/src/config/retrofit_config.dart';
import 'package:mentos_flutter/src/presentation/page/app/view/app.dart';
import 'package:mentos_flutter/src/util/resource/logger.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      // Flutter가 초기화 될때까지 기다림
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
      // Splash 상태에서 대기
      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      await dotenv.load(fileName: 'assets/config/.env');
      setupKakaoSDK();
      setupFirebaseConfig();
      setupRetrofitConfig();
      setupDIConfig();
      setupBlocConfig();

      // 앱 실행
      runApp(const App());
      // Splash 종료
      FlutterNativeSplash.remove();
    },
    (error, stack) => logger.e(error.runtimeType.toString()) // FirebaseCrashlytics.instance.recordError(error, stack, fatal: true)
  );


}