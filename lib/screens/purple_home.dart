import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:smart_mhealth_companion/components/bottom_navbar.dart';
import 'package:smart_mhealth_companion/components/button.dart';
import 'package:smart_mhealth_companion/components/center_text.dart';
import 'package:smart_mhealth_companion/components/codigo_verifica%C3%A7%C3%A3o.dart';
import 'package:smart_mhealth_companion/screens/placeholder.dart';
import 'package:smart_mhealth_companion/themes/color.dart';


class PurpleHome extends StatelessWidget {
  const PurpleHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: accentColor,
      appBar: AppBar(
        backgroundColor: accentColorMedium,
       ),
        body: Center(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 65, left: 30, right: 30),
                child: CenterTxt(30, "Insira abaixo o código de conexão do aplicativo administrador"),      
                ),
                const Padding(
                padding: EdgeInsets.only(top: 50, left: 35),
                child: CodigoVerificacao(),          
                  ),
              Padding(
                padding: const EdgeInsets.only(top: 64, left: 88, right: 88),
                child: ElevatedButton(
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Bem-vindo ao Despertador Deles'),
                      content: const Text('Você está conectado a Ana Clara!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'OK'),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                    child: const Text('OK'),
                      style: ElevatedButton.styleFrom(
                      primary: accentColorMedium,
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
                )
              ),
                Row(
                    children: const[
                    Padding(
                      padding: EdgeInsets.only(top: 55, left: 35),
                      child: Iconify(Eva.info_fill,
                      color: accentColorMedium, size: 40),          
                  ),
                    Padding(
                    padding: EdgeInsets.only(top: 55, left: 30, right: 30),
                    child: CenterTxt(20, "O que é esse código?"),
                      )
                    ],
                ),
            ],
        ),  
      )
    );
  }
}
