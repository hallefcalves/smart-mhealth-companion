import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_mhealth_companion/components/bottom_navbar.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:smart_mhealth_companion/components/button+icon.dart';
import 'package:smart_mhealth_companion/components/button.dart';
import 'package:smart_mhealth_companion/components/center_text.dart';
import 'package:smart_mhealth_companion/screens/placeholder.dart';
import 'package:smart_mhealth_companion/themes/color.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';



class Contatos extends StatelessWidget {
  const Contatos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: accentColorMedium,
       ),
      backgroundColor: accentColor,
      body: Center(
        child: ListView(
	        children:[   
            SizedBox(
            height: 400,
            child: ListView.builder(itemBuilder: (context, index){
              return Card(
                color: accentColor,
                child: Padding(
                  padding: EdgeInsets.only(left: 75, right: 75),
                  child: Container(
                  height: 390,
                  width: 247.0,
                  alignment: Alignment.center,
                  child: Column(
                    children: const [
                      Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: CircleAvatar(
                          backgroundImage: AssetImage('lib/assets/anaclara_prf.png'),
                          radius: 130,
                        )
                      ),
                      Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: CenterTxt(27, FontWeight.w700, 'Você está conectado a \n [Cuidador]'),
                      ),
                    ],
                  ),
                ),
              ),
              );
            }, scrollDirection: Axis.horizontal,),
            ),
            Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 60,
              width: 320,
              decoration: const BoxDecoration(
                color: accentColorLight,
              ),
              child: Row(
                children: [
                 Padding(
              padding: const EdgeInsets.only(left: 30),
                    child:Transform.scale(scaleX: -1, child: const Iconify(IconParkOutline.hand_drag, color: accentColorMedium, size: 45))),
                  const Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: CenterTxt(24, FontWeight.w500, 'Arraste')),
                    const Padding(
              padding: EdgeInsets.only(left: 75),
                    child:Iconify(IconParkOutline.hand_drag, color: accentColorMedium, size: 45))
               ],
                ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 13, right: 13, bottom: 20),
              child: CustomBtnIcon(const Iconify(Eva.phone_call_fill,color: Colors.white, size: 40), 'Clique aqui para ligar', accentColorMedium, PlaceholderWidget()),
            ),
	        ],
        ),
      ),
    );
  }
}