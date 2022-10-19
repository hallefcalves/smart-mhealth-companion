import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:smart_mhealth_companion/HTTP/cuidador/cuidador.dart';
import 'package:smart_mhealth_companion/HTTP/cuidador/web_cuidador.dart';
import 'package:smart_mhealth_companion/components/button_dialog.dart';
import 'package:smart_mhealth_companion/components/center_text.dart';
import 'package:smart_mhealth_companion/components/codigo_verificacao.dart';
import 'package:smart_mhealth_companion/components/icon_buttom_dialog.dart';
import 'package:smart_mhealth_companion/components/txt_buttom_dialog.dart';
import 'package:smart_mhealth_companion/screens/purple_contacts.dart';
import 'package:smart_mhealth_companion/themes/color.dart';
import 'package:smart_mhealth_companion/util/sessao.dart';


class PurpleHome extends StatefulWidget {
  const PurpleHome({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PurpleHome createState() => _PurpleHome();
}

class _PurpleHome extends State<PurpleHome> {
  @override
  void initState() {
    super.initState();
  }

  String codigoConexao = "";

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
                Padding(
                padding: const EdgeInsets.only(top: 50, left: 35),
                child: CodigoVerificacao(onTextoConcluido: obtemCodigo),          
                  ),
               Padding(
                padding: const EdgeInsets.only(top: 64, left: 88, right: 88),
                child: ElevatedButton(
                    onPressed: () => tentaConectarCuidado(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: accentColorMedium,
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
                    child: const Text( 'OK' ),
                  ),
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

  obtemCodigo(senha){
    codigoConexao = senha;
    debugPrint(senha);
  }

  tentaConectarCuidado() async{

    String? jsonCuidador = await obtemCuidadoPorCodigo(codigoConexao);
    debugPrint(jsonCuidador);
    if(jsonCuidador!=null&&jsonCuidador!="[]"){
      Cuidador c = Cuidador.obtemCuidador(jsonCuidador);
      debugPrint(c.name);
      //Sessao.salvarCuidador(c);
      showDialog<String>(
            context: context,
            builder: (BuildContext context) => BtnDialog(accentColor, accentColorMedium, 'Bem-vindo ao \n Despertador Deles', 'Você está conectado a ${c.name}!', '${c.name} agora pode acompanhar seus tratamentos, facilitar sua vida e ajudar a manter sua boa saúde!','lib/assets/anaclara_prf.png', const Contatos())
          );
    }
    else{
      showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog( 
                            title: const Text("Não encontramos um administrador com esse código :/"), 
                            actions:<Widget>[TextButton(onPressed: () => Navigator.pop(context, 'OK'), child: Text('OK',style: GoogleFonts.inter(fontSize: 22,fontWeight: FontWeight.w700,),),
            ),
          ], )
          );
    }
    
  }

}
