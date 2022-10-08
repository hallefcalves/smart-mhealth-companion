import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_mhealth_companion/main.dart';
import 'package:smart_mhealth_companion/screens/blue_home.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }
}

// precisa rodar sempre que cria um alarme, e quando liga o celular
Widget configAlarm(nome, hour, minute, TimeOfDay time) {
  DateTime date = DateTime.now();
  final dateTime = date.applied(time);

  tz.initializeTimeZones();
  var scheduledNotificationDateTime = tz.TZDateTime.from(dateTime, tz.local);

  var androidPlatFormChannelSpecifics = const AndroidNotificationDetails(
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

  var platformChannelSpecifics =
      NotificationDetails(android: androidPlatFormChannelSpecifics);

  flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      'Remédio',
      'Bom dia! Hora de tomar o remédio.',
      scheduledNotificationDateTime,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime);

  flutterLocalNotificationsPlugin.periodicallyShow(
    0,
    'Remédio',
    'Bom dia! Hora de tomar o remédio.',
    hour,
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
  );

  return const BlueHome();
}
