import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_mhealth_companion/components/bottom_navbar.dart';
import 'package:smart_mhealth_companion/components/notification.dart';
import 'package:smart_mhealth_companion/components/button.dart';
import 'package:smart_mhealth_companion/screens/placeholder.dart';
import 'package:smart_mhealth_companion/themes/color.dart';

class GreenHome extends StatelessWidget {
  const GreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorLight,
      appBar: AppBar(
        backgroundColor: primaryColor,
       ),
        body: Center(
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40, left: 26, right: 15),
                child: CustomNotification(
                  errorSurface,
                  errorDefault,
                  "Remédio Atrasado",
                  "Advil às 15h30 ainda não foi tomado"
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 22, left: 26, right: 15),
                child: CustomNotification(
                  infoSurface,
                  infoDefault,
                  "Próximo Alarme em Breve",
                  "Tome seu Zetia 100mg em 30 minutos"
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 22, left: 26, right: 15),
                child: CustomNotification(
                  infoSurface,
                  infoDefault,
                  "Próximo Alarme em Breve",
                  "Tome seu Atorvastatina 10mg em 15 minutos"
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 22, left: 26, right: 15),
                child: CustomNotification(
                  succefulSurface,
                  succefulDefault,
                  "Remédio Tomado",
                  "Livalo 2mg foi tomado corretamente"
                ),
              ),
            Padding(
                padding: EdgeInsets.only(top: 22, left: 26, right: 15),
                child: CustomNotification(
                  errorSurface,
                  errorDefault,
                  "Remédio Atrasado",
                  "Advil às 15h30 ainda não foi tomado"
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 22, left: 26, right: 15),
                child: CustomNotification(
                  infoSurface,
                  infoDefault,
                  "Próximo Alarme em Breve",
                  "Tome seu Zetia 100mg em 30 minutos"
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 22, left: 26, right: 15),
                child: CustomNotification(
                  infoSurface,
                  infoDefault,
                  "Próximo Alarme em Breve",
                  "Tome seu Atorvastatina 10mg em 15 minutos"
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 22, left: 26, right: 15),
                child: CustomNotification(
                  succefulSurface,
                  succefulDefault,
                  "Remédio Tomado",
                  "Livalo 2mg foi tomado corretamente"
                ),
              ),
            ],
          )
      )
    );
  }
}
