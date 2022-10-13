import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodigoVerificacao extends StatefulWidget {
  const CodigoVerificacao({Key? key, required this.onTextoConcluido}) : super(key: key);
  final Function(String) onTextoConcluido;

  @override
  // ignore: library_private_types_in_public_api
  _CodigoVerificacao createState() => _CodigoVerificacao();
}

class _CodigoVerificacao extends State<CodigoVerificacao> {
  @override
  void initState() {
    super.initState();
  }
  //String senha = "";

  final List<FocusNode> nodes = [FocusNode(),FocusNode(),FocusNode(),FocusNode()];
  final List<TextEditingController> controllers = [TextEditingController(),TextEditingController(),TextEditingController(),TextEditingController()];
  @override
  Widget build(BuildContext context) {

    List<Padding> camposSenha = [];
    for(int i = 0; i < 4; i++){
      camposSenha.add(Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Container(
            width: 58,
            height: 90,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),   
            ),
            child: Center(child: 
            TextFormField(
              controller: controllers[i],
              decoration: 
                const InputDecoration(counterText: "", hintText: '0', hintStyle: TextStyle(fontSize: 40, color: Color.fromARGB(155, 161, 161, 161)),  border: InputBorder.none),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
            focusNode: nodes[i],
            onTap: () => {controllers[i].selection = TextSelection(baseOffset: 0, extentOffset: controllers[i].value.text.length)},
            onChanged: (value) => {
              if(value!="") solveFocus(nodes, i, context)
              },
              maxLength: 1,
              //inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,],
              keyboardType: TextInputType.visiblePassword,
            ),
            )
          ),
        ),);
    }
    return Row(
      children: camposSenha,
    );
  }

  solveFocus(List<FocusNode> nodes, i, context){
    FocusScope.of(context).unfocus();
    if(i<3){
      FocusScope.of(context).requestFocus(nodes[i+1]);
      int qtdChars = controllers[i+1].value.text.length;
      controllers[i+1].selection = TextSelection(baseOffset: 0, extentOffset: qtdChars);
    }
    widget.onTextoConcluido(controllers.map((e) => e.text).toList().join());
  }

}

/*[
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Container(
            width: 58,
            height: 90,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),   
            ),
            child: Center(child: 
            TextField(
              decoration: 
                const InputDecoration(counterText: "", hintText: '0', hintStyle: TextStyle(fontSize: 40, color: Color.fromARGB(155, 161, 161, 161)),  border: InputBorder.none),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
              maxLength: 1,
              //inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,],
              keyboardType: TextInputType.visiblePassword,
            ),
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Container(
            width: 58,
            height: 90,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),   
            ),
            child: Center(child: 
            TextField(
              decoration: 
                const InputDecoration(counterText: "", hintText: '0', hintStyle: TextStyle(fontSize: 40, color: Color.fromARGB(155, 161, 161, 161)),  border: InputBorder.none),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
              maxLength: 1,
              //inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,],
              keyboardType: TextInputType.visiblePassword,
            ),
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Container(
            width: 58,
            height: 90,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),   
            ),
            child: Center(child: 
            TextField(
              decoration: 
                const InputDecoration(counterText: "", hintText: '0', hintStyle: TextStyle(fontSize: 40, color: Color.fromARGB(155, 161, 161, 161)),  border: InputBorder.none),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
              maxLength: 1,
              //inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,],
              keyboardType: TextInputType.visiblePassword,
            ),
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: Container(
            width: 58,
            height: 90,
            decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),   
            ),
            child: Center(child: 
            TextField(
              decoration: 
                const InputDecoration(counterText: "", hintText: '0', hintStyle: TextStyle(fontSize: 40, color: Color.fromARGB(155, 161, 161, 161)),  border: InputBorder.none),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
              fontSize: 40,
              fontWeight: FontWeight.w700,
            ),
              maxLength: 1,
              //inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly,],
              keyboardType: TextInputType.visiblePassword,
            ),
            )
          ),
        ),
      ] */
