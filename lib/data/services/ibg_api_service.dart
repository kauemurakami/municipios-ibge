import 'package:brasiltransparenteapp/data/models/estado_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const BASE_URL = "https://servicodados.ibge.gov.br/api/v1/localidades/estados/";

class IBGEApi {


  IBGEApi();

  Future<List<Estado>> getEstados() async {
    http.Response response = await http.get(BASE_URL);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200){
      List<dynamic> dadosJson = json.decode(response.body);
      List<Estado> estados = dadosJson.map<Estado>(
        (map){
          return Estado.fromJson(map);
        }
      ).toList();
      return estados;
    }else print('sem retorno');
  
  }
}