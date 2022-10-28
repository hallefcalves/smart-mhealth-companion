import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_mhealth_companion/screens/blue_home.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:uuid/uuid.dart';

extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> initializeNotifications() async {
  AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('logo_verde');

  const IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();

  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  debugPrint('NotificationsManager.dart::: notification!!!');
  flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: onSelectNotification);
}

const androidNotificationDetails = AndroidNotificationDetails(
  'alarm_notif',
  'alarm_notif',
  channelDescription: 'Channel for Alarm notification',
  icon: 'logo_verde',
  playSound: true,
  fullScreenIntent: true,
  sound: RawResourceAndroidNotificationSound('oxygen'),
  largeIcon: DrawableResourceAndroidBitmap('logo_verde'),
  importance: Importance.max,
  color: Color.fromARGB(255, 240, 240, 240),
  priority: Priority.high,
);
var iOSNotificationDetails = const IOSNotificationDetails();
var generalNotificationDetails = NotificationDetails(
    android: androidNotificationDetails, iOS: iOSNotificationDetails);

shootNotification(String title, String body, String payload, context) async {
  // var flutterLocalNotificationsPlugin =
  //     HealthCareApp.getNotificationsPlugin(context);

  await flutterLocalNotificationsPlugin
      .show(002, title, body, generalNotificationDetails, payload: payload);
}

showNotification(String? payload) {
  navigatorKey.currentState!.pushNamed('/alarm', arguments: {"payload": payload});
}

void onSelectNotification(String? payload) async {
  debugPrint('main.dart::: notification arrived!!!');

  if (payload != null) {
    debugPrint('notification payload: $payload');
  }

  // print('payloadReference: $payload');
  // BuildContext _context = navigatorKey.currentContext;

  showNotification(payload!);
}

// precisa rodar sempre que cria um alarme, e quando liga o celular
Widget configAlarm(id, nome, time, freq, payload) {
  TimeOfDay test;
  if (time is DateTime) {
    test = TimeOfDay.fromDateTime(time);
  } else {
    test = time;
  }
  DateTime date = DateTime.now();
  final dateTime = date.applied(test);

  tz.initializeTimeZones();
  var scheduledNotificationDateTime = tz.TZDateTime.from(dateTime, tz.local);

  var platformChannelSpecifics = NotificationDetails(
      android: androidNotificationDetails, iOS: iOSNotificationDetails);

  payload = 'Tomar Remédio $nome';
  if (id == 0) {
    id = const Uuid().v4();
  }
  freq = RepeatInterval.daily;
  flutterLocalNotificationsPlugin.zonedSchedule(
      id.hashCode,
      nome,
      'Olá! Hora de tomar o remédio.',
      scheduledNotificationDateTime,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      payload: payload);

  /* flutterLocalNotificationsPlugin.periodicallyShow(
    0,
    'Remédio',
    'Bom dia! Hora de tomar o remédio.',
    hour, 
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
    payload: payload
  ); */

  return const BlueHome();
}
