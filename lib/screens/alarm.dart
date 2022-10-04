import 'package:flutter/material.dart';
import 'package:smart_mhealth_companion/main.dart';
import '../themes/color.dart';
import 'config_alarme.dart';

class Alarm extends StatelessWidget with PreferredSizeWidget {
  const Alarm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => MediaQuery(
            data: const MediaQueryData(),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Scaffold(
                body: Container(
                  color: MyTheme.defaultTheme.backgroundColor,
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 24.0),
                          child: Text(
                            "Atorvastina 10mg",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 64.0,
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter"),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: ClipOval(
                            child: Image.asset(
                          'lib/assets/exemplo_remedio.png',
                          fit: BoxFit.fitHeight,
                          //height: 490,
                          //width: 490,
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Container(
                          color: const Color(0xffffffff),
                          alignment: Alignment.center,
                          height: 200.0,
                          child: const Text(
                            "Mensagem ao receber alarme",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w400,
                                fontFamily: "Inter"),
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () => {
                                //Navigator.pushNamed(context, '/config_alarme')
                                Destino.pagina = const ConfigAlarm(),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const MyApp()),
                                ) /*validar que tomou o remedio*/
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyTheme.primaryMedium,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'OK',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter"),
                              ),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () => {/*validar que foi adiado*/},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyTheme.errorDefaut,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text(
                                'Adiar',
                                style: TextStyle(
                                    fontSize: 25.0,
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Inter"),
                              ),
                            ),
                          ]),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
