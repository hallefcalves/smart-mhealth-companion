import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_mhealth_companion/components/bottom_navbar.dart';
import 'package:smart_mhealth_companion/screens/alarm.dart';
import 'package:smart_mhealth_companion/screens/green_home.dart';
import 'package:smart_mhealth_companion/screens/green_intro.dart';
import 'package:smart_mhealth_companion/screens/placeholder.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initializationSettinsAndroid =
      const AndroidInitializationSettings('logo_verde');
  var initializationSettings =
      InitializationSettings(android: initializationSettinsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    if (payload != null) {
      //Navigator.pushNamed(context, '/alarm');
      Destino.pagina = const GreenIntro();
      runApp(const MaterialApp(
        //errado, acho
        home: BottomNavBar(),
        //routes: routes
      ));

      debugPrint('notification payload: $payload');
    }
  });

/*   if(Destino.pagina is! alarm){
    Destino.pagina = alarm_config();
  }
 */
  runApp(const MaterialApp(
    home: BottomNavBar(), // becomes the route named '/'
    //routes: routes
  ));

  //runApp(const MyApp());
}

var routes = {
  '/alarm': (BuildContext context) => const Alarm(),
  '/green_home': (BuildContext context) => const GreenHome(),
  '/placeholder': (BuildContext context) => const PlaceholderWidget(),
};

class Destino {
  static StatelessWidget? pagina;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const BottomNavBar(),
    );
  }
}