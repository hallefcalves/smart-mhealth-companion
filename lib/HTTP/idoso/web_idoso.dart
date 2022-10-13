import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../web.dart';
import 'idoso.dart';

Future<String?> obtemIdoso(id) async {
  return Orion.obtemDados(id);
}

Future<String?> obtemListaIdosos(idCuidador) async {
  return Orion.obtemDadosQuery('?type=idoso&q=refCuidador==$idCuidador');
}

alteraIdoso(dadosIdoso) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
  http.Request('POST', Uri.parse('http://${Orion.url}:1026/v2/op/update'));
  request.body = Idoso.obtemJson(dadosIdoso);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    response.stream.bytesToString().then((String value) => debugPrint(value));
  } else {
    debugPrint(response.reasonPhrase);
  }
}

deletaIdoso(id) async {
  return Orion.deletaEntidade(id, "idoso");
}



/*criaIdoso(dadosIdoso) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
  http.Request('POST', Uri.parse('http://${Orion.url}:1026/v2/op/update'));
  request.body = Idoso.obtemJson(dadosIdoso);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    response.stream.bytesToString().then((String value) => debugPrint(value));
  } else {
    debugPrint(response.reasonPhrase);
  }
}*/




