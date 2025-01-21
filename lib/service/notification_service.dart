import 'package:ata/widget/const.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    if (prefs.getBool("switch") == null) {
      prefs.setBool("switch", true);
    }
    gettoken();
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

    if (kDebugMode) {
      print(prefs.getBool("switch"));
    }
    if (kDebugMode) {
      print(emoji);
    }
    if (prefs.getBool("switch") == true) {
      await LocalNotificationService().init();

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // Handle the received message here
        String body = message.notification?.body ?? "Ata";
        LocalNotificationService().showNotification(
          body: body,
          title: "ATA",
          id: 0,
        );
        if (prefs.getStringList("notification") == null) {
          prefs.setStringList("notification", ["$body#*#${DateTime.now()}"]);
        } else {
          prefs.setStringList(
              "notification",
              prefs.getStringList("notification")! +
                  ["$body#*#${DateTime.now()}"]);
        }
        if (kDebugMode) {
          print(emoji);
          print("Received message: ${message.notification?.body}");
        }
      });
    }
  }

  static gettoken() async {
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    FirebaseMessaging.instance.subscribeToTopic('all');
    firebaseMessaging.getToken().then((token) {
      if (kDebugMode) {
        print("FCM Token: $token");
        print(emoji);
      }
    });
  }

  static Future<void> _backgroundHandler(RemoteMessage message) async {
    // Handle background message

    if (kDebugMode) {
      print('Handling a background message: ${message.messageId}');
    }
  }
}

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin notificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   static Future<void> initNotification() async {
//     AndroidInitializationSettings initializationSettingsAndroid =
//         const AndroidInitializationSettings('flutter_logo');

//     var initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//     );
//     await notificationsPlugin.initialize(initializationSettings,
//         onDidReceiveNotificationResponse:
//             (NotificationResponse notificationResponse) async {});
//   }

//   static notificationDetails() {
//     return const NotificationDetails(
//         android: AndroidNotificationDetails('channelId', 'channelName',
//             importance: Importance.max),
//         iOS: DarwinNotificationDetails());
//   }

//   static Future showNotification(
//       {int id = 0, String? title, String? body, String? payLoad}) async {
//     return notificationsPlugin.show(
//         id, title, body, await notificationDetails());
//   }
// }
