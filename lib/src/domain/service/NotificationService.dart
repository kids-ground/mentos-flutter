

import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mentos_flutter/src/domain/service/DeepLinkingService.dart';
import 'package:mentos_flutter/src/util/resource/logger.dart';
import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  NotificationService({required this.deepLinkingService});

  final DeepLinkingService deepLinkingService;

  static const String androidChannelId = 'high_importance_channel';
  static const String androidChannelTitle = 'Receive Push Notification In Foreground';

  late final AndroidNotificationChannel _androidChannel;
  late final FlutterLocalNotificationsPlugin _localNotifications;

  late final InitializationSettings _initializationSettings;
  late final void Function(NotificationResponse) _foregroundLocalNotificationHandler;
  late final void Function(NotificationResponse) _backgroundLocalNotificationHandler;


  // 푸시알림 권한 확인
  Future<bool> checkPermission() async {
    if (await Permission.notification.isDenied) await Permission.notification.request();

    bool isPermanentlyDenied = await Permission.notification.isPermanentlyDenied;
    if (!isPermanentlyDenied) await _setLocalNotificationHandler();

    return isPermanentlyDenied;
  }

  // FCMToken 업데이트 하기
  Future<void> updateFCMToken() async {
    String? _fcmToken = await FirebaseMessaging.instance.getToken();
    logger.i('$_fcmToken');
    // 저장
  }

  // 푸시알림 변경
  void switchPushAlarm(bool isOn) async {
    if (await Permission.notification.isPermanentlyDenied && isOn) {
      // 설정에서 꺼져 있는 상태라면 설정으로 이동
      AppSettings.openAppSettings(type: AppSettingsType.notification);
    } else if (isOn) {

    } else {

    }
  }

  void moveToNotificationSettings() {
    AppSettings.openAppSettings(type: AppSettingsType.notification);
  }

  // Local Notification 즉시 전송 (파라미터 수정 필요 - 어떤 노티 보내줄지)
  Future<void> immediatelySendLocalNotification() async {
    NotificationDetails _details = const NotificationDetails(
      android: AndroidNotificationDetails(androidChannelId, '1번 푸시'),
      iOS: DarwinNotificationDetails(
        badgeNumber: 1
      ),
    );
    logger.i('이거 왜 안나와');
    await _localNotifications.show(
        1,
        '로컬 푸시 알림',
        '로컬 푸시 알림 테스트',
        _details,
        payload: 'deepLink');
  }

  // Local Notification 스케줄 추가 - 즉시 알림, 시간 전송 가능
  Future<void> addLocalNotificationSchedule() async {

  }

  // 등록된 Local Notification 삭제 - 스케줄 추가 시 설정한 id로 취소
  void removeScheduledLocalNotification(int id) {

  }

  // 등록된 모든 스케줄 제거
  void removeAllScheduledLocalNotification() {

  }

  // Local Notification 사용을 위한 설정등록
  Future<void> localNotificationConfig({
    required Function(NotificationResponse) foregroundHandler,
    required Function(NotificationResponse) backgroundHandler,
  }) async {
    // Android 채널 설정
    _androidChannel = const AndroidNotificationChannel(
      androidChannelId,
      androidChannelTitle,
      importance: Importance.max,
    );

    // Android 설정
    var initialzationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
    // iOS 설정
    var initialzationSettingsIOS = const DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    // 설정 완료
    _localNotifications = FlutterLocalNotificationsPlugin();
    await _localNotifications
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_androidChannel);
    InitializationSettings initializationSettings = InitializationSettings(
        android: initialzationSettingsAndroid,
        iOS: initialzationSettingsIOS
    );
    _initializationSettings = initializationSettings;
    _foregroundLocalNotificationHandler = foregroundHandler;
    _backgroundLocalNotificationHandler = backgroundHandler;
  }

  // Local Push Handler 지정 - permission 요청이 자동으로 뜨기 때문에 Permission 요청 후에 호출
  Future<void> _setLocalNotificationHandler() async {
    await _localNotifications.initialize(
      _initializationSettings,
      onDidReceiveNotificationResponse: _foregroundLocalNotificationHandler,
      onDidReceiveBackgroundNotificationResponse: _backgroundLocalNotificationHandler,
    );
  }
}