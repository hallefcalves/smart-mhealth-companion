import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_mhealth_companion/HTTP/ingestao_remedio/ingestao_remedio.dart';

import '../web.dart';

Future<String?> obtemRemedio(id) async {
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://${Orion.url}:1026/v2/entities/$id'));
  request.body = '''''';

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    /*response.stream.bytesToString().then((String value) => );*/
    return response.stream.bytesToString();
  } else {
    debugPrint(response.reasonPhrase);
  }
  return null;
}

Future<String?> obtemListaRemedios(idCuidador) async {
  return Orion.obtemDadosQuery('?type=remedio&q=refCuidador==$idCuidador');
}

alteraRemedio(dadosRemedio) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
  http.Request('POST', Uri.parse('http://${Orion.url}:1026/v2/op/update'));
  request.body = RemedioIngestao.obtemJson(dadosRemedio);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    response.stream.bytesToString().then((String value) => debugPrint(value));
  } else {
    debugPrint(response.reasonPhrase);
  }
}

criaRemedio(dadosRemedio) async {
  return Orion.criaEntidade(RemedioIngestao.obtemJson(dadosRemedio));
}

deletaRemedio(id) async {
  return Orion.deletaEntidade(id, "remedio");
}
