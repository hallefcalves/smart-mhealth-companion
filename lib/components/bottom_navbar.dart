// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/fa.dart';
import 'package:iconify_flutter/icons/fluent.dart';
import 'package:smart_mhealth_companion/screens/alarm.dart';
import 'package:smart_mhealth_companion/screens/blue_home.dart';
import 'package:smart_mhealth_companion/screens/config_alarme.dart';
import 'package:smart_mhealth_companion/screens/green_home.dart';
import 'package:smart_mhealth_companion/screens/green_intro.dart';
import 'package:smart_mhealth_companion/screens/purple_home.dart';
import 'package:smart_mhealth_companion/screens/placeholder.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _telas = [
    PurpleHome(),
    GreenHome(),
    BlueHome(),
    PlaceholderWidget()
  ];
  int _indiceAtual = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Iconify(Bi.person_badge_fill,
                color: Color.fromARGB(255, 169, 143, 255), size: 70),
            label: 'Cuidador',
            backgroundColor: Color.fromARGB(255, 232, 225, 255),
          ),
          BottomNavigationBarItem(
            icon: Iconify(Fa.home,
                color: Color.fromARGB(255, 130, 197, 187), size: 70),
            label: 'Menu',
            backgroundColor: Color.fromARGB(255, 185, 223, 217),
          ),
          BottomNavigationBarItem(
            icon: Iconify(Fluent.pill_24_filled,
                color: Color.fromARGB(255, 95, 190, 229), size: 75),
            label: 'Remédios',
            backgroundColor: Color.fromARGB(255, 207, 235, 246),
          ),
        ],
        type: BottomNavigationBarType.shifting,
          showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
      ),
    );
  }


  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
