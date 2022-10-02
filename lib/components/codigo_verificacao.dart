import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

class CodigoVerificacao extends StatelessWidget {
  const CodigoVerificacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Container(
            width: 58,
            height: 90,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),   
            ),
            child: Center(child: 
            TextField(
              decoration: 
                const InputDecoration(counterText: "", hintText: '0', hintStyle: TextStyle(fontSize: 40, color: Color.fromARGB(155, 161, 161, 161)),  border: InputBorder.none),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
              maxLength: 1,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,],
              keyboardType: TextInputType.number,
            ),
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Container(
            width: 58,
            height: 90,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),   
            ),
            child: Center(child: 
            TextField(
              decoration: 
                const InputDecoration(counterText: "", hintText: '0', hintStyle: TextStyle(fontSize: 40, color: Color.fromARGB(155, 161, 161, 161)),  border: InputBorder.none),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
              maxLength: 1,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,],
              keyboardType: TextInputType.number,
            ),
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Container(
            width: 58,
            height: 90,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),   
            ),
            child: Center(child: 
            TextField(
              decoration: 
                const InputDecoration(counterText: "", hintText: '0', hintStyle: TextStyle(fontSize: 40, color: Color.fromARGB(155, 161, 161, 161)),  border: InputBorder.none),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
              maxLength: 1,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,],
              keyboardType: TextInputType.number,
            ),
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Container(
            width: 58,
            height: 90,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),   
            ),
            child: Center(child: 
            TextField(
              decoration: 
                const InputDecoration(counterText: "", hintText: '0', hintStyle: TextStyle(fontSize: 40, color: Color.fromARGB(155, 161, 161, 161)),  border: InputBorder.none),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
              maxLength: 1,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,],
              keyboardType: TextInputType.number,
            ),
            )
          ),
        ),
      ],
    );
  }
}
