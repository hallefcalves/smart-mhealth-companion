// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/fa.dart';
import 'package:iconify_flutter/icons/fluent.dart';
import 'package:smart_mhealth_companion/screens/blue_add_remedio.dart';
import 'package:smart_mhealth_companion/screens/blue_home.dart';
import 'package:smart_mhealth_companion/screens/green_home.dart';
import 'package:smart_mhealth_companion/screens/purple_contacts.dart';
import 'package:smart_mhealth_companion/screens/purple_home.dart';
import 'package:smart_mhealth_companion/screens/placeholder.dart';
import 'package:smart_mhealth_companion/themes/color.dart';

GlobalKey navBarGlobalKey = GlobalKey(debugLabel: 'bottomAppBar');

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

final routes = {
  '/placeholder': (BuildContext context) => PlaceholderWidget(),
  '/blue_addRemedio': (BuildContext context) => CadastrarRemedio(),
  '/purple_contacts': (BuildContext context) => Contatos(),
};

int _indiceAtual = 1;

class _BottomNavBarState extends State<BottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _indiceAtual,
        children: <Widget>[
          Navigator(onGenerateRoute: (settings) {
            Widget page = PurpleHome();
            return MaterialPageRoute(builder: (context) => page);
          }),
          Navigator(onGenerateRoute: (settings) {
            Widget page = GreenHome();
            return MaterialPageRoute(builder: (context) => page);
          }),
          Navigator(onGenerateRoute: (settings) {
            Widget page = BlueHome();
            return MaterialPageRoute(builder: (context) => page);
          }),
        ],
      ),


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Iconify(Bi.person_badge_fill,
                color: accentColorMedium, size: 70),
            label: 'Cuidador',
            backgroundColor: accentColor,
          ),
          BottomNavigationBarItem(
            icon: Iconify(Fa.home,
                color: primaryColor, size: 70),
            label: 'Menu',
            backgroundColor: primaryColorLight,
          ),
          BottomNavigationBarItem(
            icon: Iconify(Fluent.pill_24_filled,
                color: secondaryColor, size: 75),
            label: 'Remédios',
            backgroundColor: secondaryColorLight,
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
