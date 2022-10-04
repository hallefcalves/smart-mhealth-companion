import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CenterTxt extends StatelessWidget {
  const CenterTxt(this.tamanhoFont, this.fontWeight, this.texto, {super.key});
  final double tamanhoFont;
  final FontWeight fontWeight;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          fontSize: tamanhoFont,
          fontWeight: fontWeight,
        ),
        texto,
      ),
    );
  }
}
