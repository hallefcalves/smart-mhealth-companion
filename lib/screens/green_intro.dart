import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fa.dart';
import 'package:smart_mhealth_companion/components/button.dart';
import 'package:smart_mhealth_companion/components/center_text.dart';
import 'package:smart_mhealth_companion/screens/purple_intro.dart';
import 'package:smart_mhealth_companion/themes/color.dart';


class GreenIntro extends StatelessWidget {
  const GreenIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 185, 223, 217),
      body: Center(
        child: ListView(
        children: [
          const Padding(
              padding: EdgeInsets.only(top: 35, left: 13, right: 13),
              child: CenterTxt(40, FontWeight.w700, "Bem-Vindo ao seu Despertador de Remédios"),
              ),
             
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 40, right: 40,),
            child:CenterTxt(22, FontWeight.w700, "Nessa página você irá encontrar informações sobre os alarmes das suas medicações"),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 13),
            child: Iconify(Fa.home,
                color: Color.fromARGB(255, 130, 197, 187), size: 150),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 100, right: 100),
            child: CustomBtn(
              "Próximo",
               MyTheme.defaultTheme.primaryColor,
                const PurpleIntro(),
              )
          ),
        ],// Children
      ),
      )
    );
  }
}
