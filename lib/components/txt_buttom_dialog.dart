import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:smart_mhealth_companion/components/center_text.dart';

class TxtDialog extends StatelessWidget {
  const TxtDialog(this.txtBtn, this.corCaixa, this.corIcone, this.titulo, this.descricao,
      this.texto, {super.key});
  final Color corCaixa;
  final Color corIcone;
  final String titulo;
  final String descricao;
  final String texto;
  final String txtBtn;
  @override
  Widget build(BuildContext context) {
    return TextButton(
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
                  padding: const EdgeInsets.only(top: 10),
                  child: CenterTxt(19, FontWeight.w500, descricao)),
              Padding(
                padding: const EdgeInsets.only(top: 35),
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
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      child:  Text(
        txtBtn,
        style: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        ),
    );
  }
}
