import 'dart:convert';

import 'package:http/http.dart' as http;

Future<String?> fetchData(codigo) async {
  var request = http.Request(
      'GET',
      Uri.parse(
          'http://localhost:1026/v2/entities/urn:ngsi-ld:Shelf:unit001/?options=values&attrs=refStore'));
  request.body = '''''';

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

sendData() async {
  var headers = {'Content-Type': 'application/json'};
  var request =
      http.Request('POST', Uri.parse('http://localhost:1026/v2/op/update'));
  request.body = json.encode({
    "id": "urn:ngsi-ld:remedio:001",
    "type": "remedio",
    "name": {"type": "string", "value": "Advil"},
    "imagem": {
      "type": "string",
      "value":
          "https://www.erifarma.com.br/medicamentos/advil-400mg-20-capsulas"
    },
    "lote": {"type": "Text", "value": "AR750"},
    "qtdPilulas": {"type": "Integer", "value": 8},
    "dataValidade": {"type": "date", "value": "22/07/2029"},
    "refIdoso": {"type": "Relationship", "value": "urn:ngsi-ld:Idoso:001"}
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}

/* todos> dataCriacao:data
?todos> ultimaAtualizacao:data

remedios: {
    id: string,
    nome: "",
    img: "",
    lote: "",
    qtdPilulas: int,
    dataValidade: date,
    codigo: ref,
}

{
    "id": "urn:ngsi-ld:remedio:001",
    "type": "remedio",
    "name": {"type": "string", "value": "Advil"},
    "imagem": {
      "type": "string",
      "value":
          "https://www.erifarma.com.br/medicamentos/advil-400mg-20-capsulas"
    },
    "lote": {"type": "Text", "value": "AR750"},
    "qtdPilulas": {"type": "Integer", "value": 8},
    "dataValidade": {"type": "date", "value": "22/07/2029"},
    "refIdoso": {"type": "Relationship", "value": "urn:ngsi-ld:Idoso:001"}
  }

alarme: {
    id: string,
    horario_inicio: time,
    frequencia: ref,
    remedio:ref,
    codigo: ref,
}

{
    "id": "urn:ngsi-ld:alarme:001",
    "type": "alarme",
    "name":{
      "type": "Text"
      "value": "8 em 8"
    }
    "horario_inicio": "08:11 UTC-3"
    "remedio": {"type":"Relationship", "value":"urn:ngsi-ld:remedio:001"}
    "codigo":  {"type":"Relationship", "value":"102536"}
}

ingestaoRemedios {
    id: string,
    remedio: ref,
    dataHora: timestamp,
    tentativasAtraso: int,
    tomou: bool,
    codigo: ref,
} 

idoso {
  id: string,
  refRemedio: [],
  refAlarme: [],
  refIngestaoRemedios: [],
  codigo: int,
}

http://{{url}}:1026/v2/entities/?q=name==Advil&type=remedio

 */