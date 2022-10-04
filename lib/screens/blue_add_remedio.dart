import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/eva.dart';
import 'package:smart_mhealth_companion/components/buttom_dialog.dart';
import 'package:smart_mhealth_companion/components/left_text.dart';
import 'package:smart_mhealth_companion/screens/blue_home.dart';
import 'package:smart_mhealth_companion/themes/color.dart';

class CadastrarRemedio extends StatefulWidget {
  const CadastrarRemedio({Key? key}) : super(key: key);

  @override
  State<CadastrarRemedio> createState() => _CadastrarRemedioState();
}

class _CadastrarRemedioState extends State<CadastrarRemedio> {
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColorLight,
      appBar: AppBar(
        backgroundColor: secondaryColor,
      ),
      body: ListView(
        children: <Widget>[
          Stack(
            children: const [
              Padding(
                  padding: EdgeInsets.only(top: 15, left: 110, right: 71),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('lib/assets/exemplo_remedio.png'),
                    radius: 80,
                  )),
              Padding(
                  padding: EdgeInsets.only(top: 15, left: 265),
                  child: Iconify(Eva.question_mark_circle_fill,
                      color: infoDefault, size: 45)),
              Padding(
                  padding: EdgeInsets.only(top: 130, left: 265),
                  child:
                      Iconify(Eva.camera_fill, color: infoDefault, size: 45)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 600,
              height: 100,
              decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40.0, right: 28.0, left: 29.0, bottom: 15.0),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                      height: 0.8,
                    ),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      alignLabelWithHint: false,
                      hintText: 'Ex. Advil',
                      hintStyle: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.withOpacity(0.5),
                      ),
                      labelText: 'Nome do remédio',
                      labelStyle: GoogleFonts.roboto(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 2, left: 29),
                      child: LeftTxt(20, FontWeight.w400, 'Nome do Remédio:'),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 1, left: 90),
                        child: Iconify(Eva.question_mark_circle_fill,
                            color: infoDefault, size: 35))
                  ],
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 600,
              height: 100,
              decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40.0, left: 35.0, bottom: 15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _selectTime(context);
                    },
                    child: const Text("Choose Time"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${selectedTime.hour}:${selectedTime.minute}"),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 2, left: 29),
                      child: LeftTxt(20, FontWeight.w400, 'Nome do Remédio:'),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 1, left: 90),
                        child: Iconify(Eva.question_mark_circle_fill,
                            color: infoDefault, size: 35))
                  ],
                ),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 600,
              height: 100,
              decoration: BoxDecoration(
                color: secondaryColor.withOpacity(0.4),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 40.0, left: 35.0, bottom: 15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _selectTime(context);
                    },
                    child: const Text("Choose Time"),
                  ),
                ),
                Text("${selectedTime.hour}:${selectedTime.minute}"),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 2, left: 29),
                      child: LeftTxt(20, FontWeight.w400, 'Nome do Remédio:'),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 1, left: 90),
                        child: Iconify(Eva.question_mark_circle_fill,
                            color: infoDefault, size: 35))
                  ],
                ),
              ]),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10, left: 35, right: 35),
              child: BtnDialog(
                  accentColorLight,
                  secondaryColor,
                  'Parabéns!',
                  'Você cadastrou o remédio Advil com sucesso!',
                  '',
                  'lib/assets/exemplo_remedio.png',
                  const BlueHome(),
                  'Concluir')),
        ],
      ),
    );
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
