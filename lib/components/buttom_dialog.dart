import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:smart_mhealth_companion/components/center_text.dart';
import 'package:smart_mhealth_companion/screens/placeholder.dart';
import 'package:smart_mhealth_companion/screens/purple_contacts.dart';

class BtnDialog extends StatelessWidget {
  BtnDialog(this.corCaixa, this.corIcone, this.titulo, this.descricao,
      this.texto, this.imagem, this.child, this.btntitulo, {super.key});
  final Color corCaixa;
  final Color corIcone;
  final String titulo;
  final String descricao;
  final String texto;
  final String imagem;
  final Widget child;
  final String btntitulo;

  final routes = {
    '/placeholder': (BuildContext context) => const PlaceholderWidget(),
    '/purple_contacts': (BuildContext context) => const Contatos(),
  };

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9))),
          backgroundColor: corCaixa,
          title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 1),
                child: IconButton(
                  icon:
                      Iconify(Eva.close_circle_fill, color: corIcone, size: 45),
                  onPressed: () => Navigator.pop(context, 'OK'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: CenterTxt(22, FontWeight.w700, titulo),
              )
            ],
          ),
          content: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Image.asset(
                  imagem,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 220),
                  child: CenterTxt(19, FontWeight.w500, descricao)),
              Padding(
                padding: const EdgeInsets.only(top: 270),
                child: CenterTxt(16, FontWeight.w400, texto),
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: Text(
                'OK',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: corIcone,
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
      child: Text(btntitulo),
    );

  }
}
