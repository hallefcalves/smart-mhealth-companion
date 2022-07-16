import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_companion/themes/color.dart';

class CustomBtn extends StatelessWidget {
  CustomBtn(this.btntext, this.themeColor, this.path);
  final String btntext;
  final Color themeColor;
  final String path;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, path),
      style: ElevatedButton.styleFrom(
        primary: themeColor,
        textStyle: TextStyle(
          fontFamily: GoogleFonts.inter().fontFamily,
          fontSize: 25,
        ),
        minimumSize: const Size(170, 65),
        maximumSize: const Size(340, 130),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        btntext,
      ),
    );
  }
}
