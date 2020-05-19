import 'package:brasiltransparenteapp/data/models/cidade_model.dart';
import 'package:brasiltransparenteapp/data/models/estado_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const BASE_URL_ESTADOS = "https://servicodados.ibge.gov.br/api/v1/localidades/estados/";
const BASE_RUL_CIDADES = "https://servicodados.ibge.gov.br/api/v1/localidades/estados/";
class IBGEApi {
  IBGEApi();

  Future<List<Estado>> getEstados() async {
    http.Response response = await http.get(BASE_URL_ESTADOS);
    if (response.statusCode == 200) {
      List<dynamic> dadosJson = json.decode(response.body);
      List<Estado> estados = dadosJson.map<Estado>((map) {
        return Estado.fromJson(map);
      }).toList();
      return estados;
    } else
      print('sem retorno');
  }

  Future<List<Cidade>> getCidades(Estado estado) async {
    http.Response response = await http.get(BASE_RUL_CIDADES+estado.sigla+'/municipios');
    if (response.statusCode == 200) {
      List<dynamic> dadosJson = json.decode(response.body);
      List<Cidade> cidades = dadosJson.map<Cidade>((map) {
        return Cidade.fromJson(map);
      }).toList();    
      return cidades;
    } else
      print('sem retorno');
  }
}
