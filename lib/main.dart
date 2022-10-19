import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_mhealth_companion/components/bottom_navbar.dart';
import 'package:smart_mhealth_companion/screens/alarm.dart';
import 'package:smart_mhealth_companion/screens/config_alarme.dart';
import 'package:smart_mhealth_companion/screens/green_home.dart';
import 'package:smart_mhealth_companion/screens/placeholder.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeNotifications();
  runApp(const MyApp());
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => const BottomNavBar(),
        '/alarm': (BuildContext context) => const Alarm(),
        '/green_home': (BuildContext context) => const GreenHome(),
        '/placeholder': (BuildContext context) => const PlaceholderWidget(),
      },
    );
  }
}
