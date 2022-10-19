import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:smart_mhealth_companion/HTTP/agenda/agenda.dart';
import 'package:smart_mhealth_companion/HTTP/agenda/web_agenda.dart';
import 'package:smart_mhealth_companion/HTTP/alarme/alarme.dart';
import 'package:smart_mhealth_companion/HTTP/alarme/web_alarme.dart';
import 'package:smart_mhealth_companion/HTTP/ingestao_remedio/ingestao_remedio.dart';
import 'package:smart_mhealth_companion/HTTP/ingestao_remedio/web_ingestao_remedio.dart';
import 'package:smart_mhealth_companion/components/button_icon.dart';
import 'package:smart_mhealth_companion/components/center_text.dart';
import 'package:smart_mhealth_companion/screens/alarm.dart';
import 'package:smart_mhealth_companion/screens/blue_add_remedio.dart';
import 'package:smart_mhealth_companion/themes/color.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';
import 'package:smart_mhealth_companion/util/sessao.dart';

import '../HTTP/idoso/idoso.dart';


class BlueHome extends StatelessWidget {
  const BlueHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: secondaryColor,
       ),
      backgroundColor: secondaryColorLight,
      body: Center(
        child: ListView(
	        children:[   
            SizedBox(
            height: 400,
            child: FutureBuilder(
              future: carregaRemedios(),
              builder: (context, AsyncSnapshot<List<Alarme>?> snapshot) {
                Widget child;
                if (snapshot.hasData&&snapshot.data!=null) {
                  //debugPrint(snapshot.data![0].name);
                  child = ListView.builder(itemBuilder: (context, index){
                    return Card(
                      color: accentColorLight,
                      child: Padding(
                        padding: const EdgeInsets.only(top:2, left: 75, right: 75),
                        child: Container(
                        height: 390,
                        width: 220.0,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Padding(
                            padding: const EdgeInsets.only(top: 2),
                            child: FutureBuilder(
                              future: carregaRemedio(snapshot.data![index].refRemedio),
                              builder: (context, AsyncSnapshot<RemedioIngestao?> snapshot) { 
                                if(snapshot.hasData){
                                  return CenterTxt(24, FontWeight.w400, snapshot.data!.name??"");
                                } 
                                return const CenterTxt(24, FontWeight.w400, 'carregando...');   
                                })
                            ),
                            Stack(
                              children:  [
                                Padding(
                                  padding: const EdgeInsets.only(top: 200),
                                  child: IconButton(
                                    icon: const Iconify(Eva.trash_2_fill, color: errorDefault, size: 40),
                                    iconSize: 50,
                                    onPressed: () => showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) => AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(9))),
                                        backgroundColor: errorSurface,
                                        title: Column(children: [
                                        const Padding(
                                              padding: EdgeInsets.only(top: 5, left: 1),
                                              child: Iconify(Eva.trash_2_fill, color: errorDefault, size: 45),
                                            ),
                                          Row(
                                          children: [    
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5, left: 1),
                                              child: IconButton(
                                                icon:
                                                    const Iconify(Eva.close_circle_fill, color: errorDefault, size: 45),
                                                onPressed: () => Navigator.pop(context, 'OK'),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: CenterTxt(20, FontWeight.w700, 'Gostaria de Deletar \n Esse Remédio?'),
                                            )
                                          ],
                                        ),
                                        ],),
                                                  
                                        content: Stack(
                                          children: const [
                                            Padding(
                                                padding: EdgeInsets.only(top: 10),
                                                child: CenterTxt(18, FontWeight.w500, 'Essa ação não poderá ser desfeita, confirme sua decisão abaixo:')),
                                          ],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () => Navigator.pop(context, 'SIM'),
                                            child: Text(
                                              'SIM',
                                              style: GoogleFonts.inter(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: errorDefault,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(context, 'SIM'),
                                            child: Text(
                                              'NÃO',
                                              style: GoogleFonts.inter(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: infoDefault,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  ),
                                const Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: CircleAvatar(
                                      backgroundImage: AssetImage('lib/assets/exemplo_remedio.png'),
                                      radius: 130,
                              )
                            ),
                          ]
                        ),
                        FutureBuilder(
                          future: carregaAgenda(snapshot.data![index].refAgenda),
                          builder: (context, AsyncSnapshot<Agenda?> snapshot) { 
                            if(snapshot.hasData){
                              return Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: CenterTxt(20, FontWeight.w400, snapshot.data!.obtemTexto()),
                            );
                            } 
                            return const Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: CenterTxt(20, FontWeight.w400, 'Carregando...'));   
                          }),
                            /*const Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: CenterTxt(20, FontWeight.w400, '[Frequência]'),
                            ),
                            const Padding(
                            padding: EdgeInsets.only(top: 2),
                            child: CenterTxt(20, FontWeight.w400, '[Próximo alarme]'),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                    );
            }, scrollDirection: Axis.horizontal,itemCount: snapshot.data!.length,);
                } else if (snapshot.hasError) {
                  child = Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    );
                } else {
                  child = const SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    );
                }
                /*if(children.isEmpty){
                  return Center(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 22, bottom: 22),
                      child: Text(
                    'Nenhum remédio associado :/',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: MyTheme.defaultTheme.primaryColor,
                      ),),
                  ));
                }*/
                return child;
              }),),
            Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: 60,
              width: 320,
              decoration:  BoxDecoration(
                color: secondaryColor.withOpacity(0.4),
              ),
              child: Row(
                children: [
                 Padding(
              padding: const EdgeInsets.only(left: 30),
                    child:Transform.scale(scaleX: -1, child: const Iconify(IconParkOutline.hand_drag, color: secondaryColorMedium, size: 45))),
                  const Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: CenterTxt(24, FontWeight.w500, 'Arraste')),
                    const Padding(
              padding: EdgeInsets.only(left: 75),
                    child:Iconify(IconParkOutline.hand_drag, color: secondaryColorMedium, size: 45))
               ],
                ),
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 13, right: 13, bottom: 20),
              child: CustomBtnIcon(const Iconify(Eva.plus_outline,color: Colors.white, size: 40), 'Novo Remédio', secondaryColorMedium, const CadastrarRemedio()),
            ),
	        ],
        ),
      ),
    );
  }

  Future<List<Alarme>?> carregaRemedios() async {//rename carrega alertas
    Idoso idoso = await Sessao.obterUserCuidado();
    String? jsonAlr = await obtemListaAlarme(idoso.id);
    debugPrint(jsonAlr);
    List<Alarme> remedios = Alarme.obtemAlarmes(jsonAlr);
    debugPrint(remedios.length.toString());
    return remedios;
  }

  Future<RemedioIngestao?> carregaRemedio(idRem)async{
    String? jsonRem = await obtemRemedioIngestao(idRem);
    //debugPrint(jsonRem);
    RemedioIngestao remedio = RemedioIngestao.obtemRemedioIngestao(jsonRem);
    //debugPrint(remedios.length.toString());
    return remedio;
  }


  Future<Agenda?> carregaAgenda(idAgenda)async{
    String? jsonRem = await obtemAgenda(idAgenda);
    //debugPrint(jsonRem);
    Agenda remedio = Agenda.obtemAgenda(jsonRem);
    //debugPrint(remedios.length.toString());
    return remedio;
  }

}