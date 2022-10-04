import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:smart_mhealth_companion/screens/placeholder.dart';

class CustomBtnIcon extends StatelessWidget {
  CustomBtnIcon(this.icone,this.btntext, this.themeColor, this.child, {super.key});
  final String btntext;
  final Color themeColor;
  final Widget child;
  final Iconify icone;

  final routes = {
    '/placeholder': (BuildContext context) => PlaceholderWidget(),
  };
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => child)),
      icon: icone,
      style: ElevatedButton.styleFrom(
        backgroundColor: themeColor,
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
      label: Text(btntext),
    );
  }
}
