// import 'dart:async';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;

// class LocalNotification {
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   static StreamController<NotificationResponse> streamController =
//       StreamController();
//   final _androidDetails = const AndroidNotificationDetails(
//       "channelId", "channelName",
//       importance: Importance.high, priority: Priority.high);
//   // ignore: prefer_function_declarations_over_variables
//   static void _onTapNotification(NotificationResponse notificationResponse) {
//     streamController.add(notificationResponse);
//   }

//   Future<void> init() async {
//     InitializationSettings initializationSettings =
//         const InitializationSettings(
//             android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//             iOS: DarwinInitializationSettings());
//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onDidReceiveBackgroundNotificationResponse: _onTapNotification,
//         onDidReceiveNotificationResponse: _onTapNotification);
//   }

//   showBasicNotification(String title, String body) {
//     NotificationDetails notificationDetails =
//         NotificationDetails(android: _androidDetails);
//     _flutterLocalNotificationsPlugin.show(0, title, body, notificationDetails);
//   }

//   showSceduleNotification(String title, String body, int secounds, int id) {
//     tz.initializeTimeZones();

//     NotificationDetails notificationDetails =
//         NotificationDetails(android: _androidDetails);
//     _flutterLocalNotificationsPlugin.zonedSchedule(
//         id,
//         title,
//         body,
//         tz.TZDateTime.now(tz.local).add(Duration(seconds: secounds)),
//         notificationDetails,
//         uiLocalNotificationDateInterpretation:
//             UILocalNotificationDateInterpretation.absoluteTime);
//   }
// }
