import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../web.dart';
import 'cuidador.dart';

Future<String?> obtemCuidador(id) async {
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://${Orion.url}:1026/v2/entities/$id'));
  //request.body = '''''';

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    /*response.stream.bytesToString().then((String value) => );*/
    return response.stream.bytesToString();
  } else {
    debugPrint(response.reasonPhrase);
  }
  return null;
}

Future<String?> obtemCuidadoPorCodigo(codigo) async {
  return Orion.obtemDadosQuery('?type=cuidador&q=codigo==$codigo');
}

Future<String?> obtemCuidadorPorEmail(email) async {
   var headers = {
        'Accept': 'application/json',
        'fiware-service': 'helixiot',
        'fiware-servicepath': '/'
      };
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://${Orion.url}:1026/v2/entities/?type=cuidador&q=email==$email'));
  //request.body = '''''';
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    /*response.stream.bytesToString().then((String value) => );*/
    return response.stream.bytesToString();
  } else {
    debugPrint(response.reasonPhrase);
  }
  return null;
}


