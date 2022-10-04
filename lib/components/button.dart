import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_mhealth_companion/screens/placeholder.dart';
import 'package:smart_mhealth_companion/screens/purple_contacts.dart';

class CustomBtn extends StatelessWidget {
  CustomBtn(this.btntext, this.themeColor, this.child, {super.key});
  final String btntext;
  final Color themeColor;
  final Widget child;

  final routes = {
  '/placeholder': (BuildContext context) => const PlaceholderWidget(),
  '/purple_contacts': (BuildContext context) => const Contatos(),
};

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => child)),
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
      child: Text(
        btntext,
      ),
    );
  }
}
