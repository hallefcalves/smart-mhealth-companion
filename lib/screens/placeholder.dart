import 'package:flutter/material.dart';
import 'package:smart_mhealth_companion/themes/color.dart';

class PlaceholderWidget extends StatelessWidget {
  const PlaceholderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: MyTheme.defaultTheme.primaryColor,
       ),
      backgroundColor: Colors.amber,
    );
  }
}
