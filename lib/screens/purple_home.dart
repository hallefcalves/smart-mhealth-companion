import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_mhealth_companion/components/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:smart_mhealth_companion/components/bottom_navbar.dart';
import 'package:smart_mhealth_companion/components/buttom_dialog.dart';
import 'package:smart_mhealth_companion/components/button.dart';
import 'package:smart_mhealth_companion/components/center_text.dart';
import 'package:smart_mhealth_companion/components/codigo_verifica%C3%A7%C3%A3o.dart';
import 'package:smart_mhealth_companion/components/icon_buttom_dialog.dart';
import 'package:smart_mhealth_companion/components/txt_buttom_dialog.dart';
import 'package:smart_mhealth_companion/screens/placeholder.dart';
import 'package:smart_mhealth_companion/screens/purple_contacts.dart';
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
                child: CenterTxt(30, FontWeight.w700, "Insira abaixo o código de conexão do aplicativo administrador"),      
                ),
                const Padding(
                padding: EdgeInsets.only(top: 50, left: 35),
                child: CodigoVerificacao(),          
                  ),
               Padding(
                padding: EdgeInsets.only(top: 64, left: 88, right: 88),
                child: BtnDialog(accentColor, accentColorMedium, 'Bem-vindo ao \n Despertador Deles', 'Você está conectado a Ana Clara!', 'Ana Clara agora pode acompanhar seus tratamentos, facilitar sua vida e ajudar a manter sua boa saúde!','lib/assets/anaclara_prf.png', Contatos(), 'OK' ),
              ),
                Row(
                    children: const[
                    Padding(
                      padding: EdgeInsets.only(top: 50, left: 35),
                      child: IconDialog(
                        Iconify(Eva.info_fill,color: accentColorMedium, size: 60), 
                        accentColor, accentColorMedium,  'Despertador Deles','', 'Nosso aplicativo pago: Despertador Deles pode ser conectado a este aplicativo, sendo possível fazer de outro celular cadastros mais completos de remédios e alarmes, acompanhar por notificações em tempo real e relatórios se os medicamentos estão sendo tomado corretamente entre outros, veja aqui.')        
                  ),
                    Padding(
                    padding: EdgeInsets.only(top: 50, left: 5, right: 30),
                    child: TxtDialog('O que é esse código?', accentColor, accentColorMedium, 'Despertador Deles', '', 'Nosso aplicativo pago: Despertador Deles pode ser conectado a este aplicativo, sendo possível fazer de outro celular cadastros mais completos de remédios e alarmes, acompanhar por notificações em tempo real e relatórios se os medicamentos estão sendo tomado corretamente entre outros, veja aqui.'),)
                    ],
                ),
            ],
        ),   
      )
    );
  }
}
