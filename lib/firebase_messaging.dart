import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print(message.notification?.title);
  print(message.notification?.body);
  print(message.data);
  // Get.to(() => TrackMapScreeen(
  //       lat: (message.data)['latitude'],
  //       lng: (message.data)['longitude'],
  //     ));
}

Future handleMessage(RemoteMessage? message) async {
  if (message == null) return;
  // if (message.data['type'] == 'alert') {
  //   Get.to(() =>MapScreeen(
  //         lat: (message.data)['latitude'],
  //         lng: (message.data)['longitude'],
  //       ));
  // } else {
  //   Get.to(() => const HomeDashboardScreen());
  // }
}

Future initLocalNotification() async {
  const iOS = IOSInitializationSettings();
  const android = AndroidInitializationSettings('@drawable/logo1');
  const settings = InitializationSettings(android: android, iOS: iOS);

  await FireBaseApi()._localNotifications.initialize(settings,
      onSelectNotification: (payload) {
    final message = RemoteMessage.fromMap(jsonDecode(payload!));
    // Get.to(() => MapScreeen(
    //       lat: (message.data)['latitude'],
    //       lng: (message.data)['longitude'],
    //     ));
    handleMessage(message);
  });

  final platform = FireBaseApi()
      ._localNotifications
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>();
  await platform?.createNotificationChannel(FireBaseApi()._androidChannel);
}

Future initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(
    handleMessage,
  );
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  FirebaseMessaging.onMessage.listen((event) {
    final notification = event.notification;
    // Get.to(() => TrackMapScreeen(
    //       lat: (notification!.body),
    //       lng: (notification.body!),
    //     ));
    if (notification == null) return;
    FireBaseApi()._localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              FireBaseApi()._androidChannel.id,
              FireBaseApi()._androidChannel.name,
              channelDescription: FireBaseApi()._androidChannel.description,
              // icon: '@drawable/logo',
            ),
          ),
          payload: jsonEncode(event.toMap()),
        );
  });
}

class FireBaseApi {
  final _firebaseMassaging = FirebaseMessaging.instance;
  final _androidChannel = const AndroidNotificationChannel(
      'high_importance_channel', 'High Importance Notifications',
      description: ' this channel is used for important notification',
      importance: Importance.high);
  final _localNotifications = FlutterLocalNotificationsPlugin();
  Future<void> initNotifications() async {
    await _firebaseMassaging.requestPermission();
    final fcmToken = await _firebaseMassaging.getToken();
    initPushNotifications();
    initLocalNotification();
    print('==========================>>> $fcmToken');
  }
}
