import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:smart_mhealth_companion/components/bottom_navbar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/fa.dart';
import 'package:iconify_flutter/icons/fluent.dart';
import 'package:smart_mhealth_companion/components/button.dart';
import 'package:smart_mhealth_companion/components/center_text.dart';
import 'package:smart_mhealth_companion/screens/blue_intro.dart';
import 'package:smart_mhealth_companion/screens/placeholder.dart';
import 'package:smart_mhealth_companion/themes/color.dart';


class PurpleIntro extends StatelessWidget {
  const PurpleIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 204, 189, 255),
      body: Center(
         child: ListView(
        children: [
          const Padding(
              padding: EdgeInsets.only(top: 35, left: 13, right: 13),
              child: CenterTxt(40, FontWeight.w700, "Bem-Vindo ao seu Despertador de Remédios"),
              ),
             
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 40, right: 40,),
            child:CenterTxt(22,FontWeight.w700, "Nessa página você poderá se conectar ao seu cuidador através do aplicativo Despertador Deles"),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 13),
            child: Iconify(Bi.person_badge_fill,
                color: Color.fromARGB(255, 169, 143, 255), size: 150),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 100, right: 100),
            child: CustomBtn(
              "Próximo",
               MyTheme.defaultTheme.primaryColor,
               BlueIntro(),
              )
          ),
        ],
      ),
      )
    );
  }
}
