import 'package:flutter/material.dart';
import 'package:smart_mhealth_companion/components/bottom_navbar.dart';
import '../themes/color.dart';

class Alarm extends StatelessWidget with PreferredSizeWidget {
  Alarm({super.key, required this.payload});

  final String payload;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return MaterialApp(
      home: Builder(
        builder: (context) => MediaQuery(
            data: MediaQueryData(),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Scaffold(
                body: Container(
                  color: MyTheme.defaultTheme.primaryColor,
                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Center(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 60, 10, 30),
                          child: Text(
                            arguments["payload"],
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 42,
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
                          height: 300,
                          width: 300,
                        )),
                      ),
                       Center(
                        child: Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(0, 10, 10, 10),
                          child: Text(
                            arguments["payload"],
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 42,
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w600,
                                fontFamily: "Inter"),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(40, 0, 40, 10),
                        child: TextFormField(
                          autofocus: true,
                          obscureText: false,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Deixe uma mensagem',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyTheme.defaultTheme.primaryColor),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(4.0),
                                topRight: Radius.circular(4.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: MyTheme.defaultTheme.primaryColor,
                              width: 2,
                            )),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => {
                                Navigator.pushNamed(context, '/config_alarme'),
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavBar()),
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
                            SizedBox(width: 20),
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
