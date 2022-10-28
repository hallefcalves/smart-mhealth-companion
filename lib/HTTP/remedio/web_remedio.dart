import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:smart_mhealth_companion/HTTP/remedio/remedio.dart';
import 'package:smart_mhealth_companion/HTTP/web.dart';

Future<String?> obtemRemedio(id) async {
  return Orion.obtemDados(id);
}

Future<String?> obtemListaRemedios(idCuidador) async {
  return Orion.obtemDadosQuery('?type=remedio&q=refCuidador==$idCuidador');
}

alteraRemedio(dadosRemedio) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse('http://${Orion.url}:1026/v2/op/update'));
  request.body = Remedio.obtemJson(dadosRemedio);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    response.stream.bytesToString().then((String value) => debugPrint(value));
  } else {
    debugPrint(response.reasonPhrase);
  }
}

criaRemedio(dadosRemedio) async {
  return Orion.criaEntidade(Remedio.obtemJson(dadosRemedio));
}

deletaRemedio(id) async {
  return Orion.deletaEntidade(id, "remedio");
}



/*
criaRemedio(dadosRemedio) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
  http.Request('POST', Uri.parse('http://${Orion.url}:1026/v2/op/update'));
  request.body = Remedio.obtemJson(dadosRemedio);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    response.stream.bytesToString().then((String value) => debugPrint(value));
  } else {
    debugPrint(response.reasonPhrase);
  }
}

deletaRemedio(id) async {
  var headers = {'Content-Type': 'application/json'};
  var request =
  http.Request('DELETE', Uri.parse('http://${Orion.url}:1026/v2/entities/?q=id==$id&type=remedio'));
  request.body = '''''';

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    response.stream.bytesToString().then((String value) => debugPrint(value));
  } else {
    debugPrint(response.reasonPhrase);
  }
}*/


