import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
