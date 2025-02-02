import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class LocalNotificationService {
  static final LocalNotificationService _instance =
      LocalNotificationService._internal();
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory LocalNotificationService() {
    return _instance;
  }

  LocalNotificationService._internal();

  Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channelId', 'channelName',
            channelDescription: 'channelDescription',
            importance: Importance.max,
            priority: Priority.high);

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await _flutterLocalNotificationsPlugin.show(
        id, title, body, notificationDetails);
  }

  Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  static setup() async {
    final prefs = await SharedPreferences.getInstance();
    bool isNotificationGranted = await Permission.notification.isGranted;
    log('Notification Permission: $isNotificationGranted');

    prefs.setBool("switch", isNotificationGranted);

    // getToken();
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

    // Debug logging
    if (kDebugMode) {
      print(prefs.getBool("switch"));
    }

    // Initialize notification service if permission granted
    if (isNotificationGranted) {
      await LocalNotificationService().init();
       FirebaseMessaging messaging = FirebaseMessaging.instance;
      NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        String body = message.notification?.body ?? "No body";
        String title = message.notification?.title ?? "No title";
        
        LocalNotificationService().showNotification(
          body: body,
          title: title,
          id: DateTime.now().millisecondsSinceEpoch,  // Unique ID based on timestamp
        );

        // Save notifications in SharedPreferences
        if (prefs.getStringList("notification") == null) {
          prefs.setStringList("notification", ["$body#*#${DateTime.now()}"]);
        } else {
          prefs.setStringList(
              "notification",
              prefs.getStringList("notification")! +
                  ["$body#*#${DateTime.now()}"]);
        }
      });
    }
  }

  static getToken() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.instance.subscribeToTopic('all');

    // Check for existing token or get a new one
    String? token = await firebaseMessaging.getToken();
    if (token != null && kDebugMode) {
      print("FCM Token: $token");
    }

    // Listen for token refresh
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      print("FCM Token refreshed: $newToken");
    });
  }

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    // Handle background message
    if (kDebugMode) {
      print('Handling a background message: ${message.messageId}');
    }
// Getting the FCM token (APNS token)
Future<void> getTokenios() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? token = await messaging.getToken();
  print('FCM Token: $token');  // Ensure you're logging the token to check it's retrieved
}
    // You can show a notification or handle the message here.
  }
}
