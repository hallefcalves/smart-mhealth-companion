import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_mhealth_companion/components/bottom_navbar.dart';
import 'package:smart_mhealth_companion/components/button.dart';
import 'package:smart_mhealth_companion/screens/placeholder.dart';
import 'package:smart_mhealth_companion/themes/color.dart';


class PurpleHome extends StatelessWidget {
  const PurpleHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor,
        body: Center(
          child: (
          CustomBtn(
            "Roxo",
             MyTheme.defaultTheme.primaryColor,
             PlaceholderWidget(),           
        )
        )
      )
    );
  }
}
