import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';
import 'package:smart_mhealth_companion/components/center_text.dart';
import 'package:smart_mhealth_companion/themes/color.dart';

class CadastrarRemedio extends StatelessWidget {
  const CadastrarRemedio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColorMedium,
      ),
      body: ListView(
        children: <Widget>[
               Stack(
                children: const [
                  Padding(
                  padding: EdgeInsets.only(left: 75),
                    child:Iconify(Eva.question_mark_circle_fill, color: secondaryColorMedium, size: 45)),
                 Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: CircleAvatar(
                      backgroundImage: AssetImage('lib/assets/exemplo_remedio.png'),
                      radius: 130,
                  )),
                Padding(
                  padding: EdgeInsets.only(left: 75),
                    child:Iconify(Eva.camera_fill, color: secondaryColorMedium, size: 45)),
               ],
                ),
          Text(
            'Nome',
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.left,
            style: GoogleFonts.rampartOne(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: MyTheme.defaultTheme.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 26.0, right: 28.0, left: 29.0, bottom: 15.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(
                height: 0.8,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                alignLabelWithHint: false,
                hintText: 'joao.silva@exemplo.com',
                hintStyle: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.withOpacity(0.5),
                ),
                labelText: 'E-mail ou Telefone',
                labelStyle: GoogleFonts.roboto(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
