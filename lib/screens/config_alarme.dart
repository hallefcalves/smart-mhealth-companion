import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_mhealth_companion/main.dart';
import 'package:smart_mhealth_companion/themes/color.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class alarm_config extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Alarm Clock',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // creating text ediiting controller to take hour
  // and minute as input
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(11)),
                  child: Center(
                    child: TextField(
                      controller: hourController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // show timers
                scheduleAlarm( int.parse(hourController.text));
              },
              child: const Text(
                "Criar Alarme",
                style: TextStyle(fontSize: 22),
              ),
            )
          ])),
    );
  }

  void scheduleAlarm(int tempo) async{
    tz.initializeTimeZones();
    var scheduledNotificationDateTime =
    tz.TZDateTime.now(tz.local).add(Duration(seconds: tempo));

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
      priority: Priority.high,);

    var platformChannelSpecifics = NotificationDetails(android: androidPlatFormChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(0, 'Remédio', 'Bom dia! Hora de tomar o remédio.',
        scheduledNotificationDateTime, platformChannelSpecifics, androidAllowWhileIdle: true, uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime);

  }

}