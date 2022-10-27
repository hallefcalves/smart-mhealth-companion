
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import '../HTTP/cuidador/cuidador.dart';
import '../HTTP/idoso/idoso.dart';

class Sessao {
  static salvarCuidador(jsonUser) async {
    debugPrint("Cuidador na session: $jsonUser");
    await SessionManager().set("user", "-$jsonUser");
  }

  static salvarUserCuidado(jsonUser) async {
    debugPrint("Cuidado na session: $jsonUser");
    await SessionManager().set("userCuidado", "-$jsonUser");
  }

  static Future<Cuidador> obterCuidador() async {
    dynamic user = await SessionManager().get("user");
    Cuidador usuario = Cuidador.obtemCuidador(user.toString().substring(1));
    return usuario;
  }

  static Future<Idoso> obterUserCuidado() async {
    dynamic user = await SessionManager().get("userCuidado");
    Idoso usuario = Idoso.obtemIdoso(user.toString().substring(1));
    return usuario;
  }

  static Future<void> logOff() async {
    await SessionManager().remove("user");
    await SessionManager().remove("userCuidado");
  }

}
