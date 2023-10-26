
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mentos_flutter/src/util/resource/logger.dart';
import 'package:permission_handler/permission_handler.dart';

import 'firebase_options.dart';

// Notification 설정 제외
Future<void> setupFirebaseConfig() async {
  // 공통설정
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await _setupCloudMessaging();
  _setupCrashlyticsConfig();
  _setupEventConfig();
}

// Firebase Cloud Message 설정
Future<void> _setupCloudMessaging() async {
  // iOS 앱이 포그라운드 상태에서도 알림 받을 수 있도록 설정
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: false,
    sound: true,
  );
}

// Firebase Crashlytics 설정
void _setupCrashlyticsConfig() {

}

// Firebase Event 설정
void _setupEventConfig() {

}