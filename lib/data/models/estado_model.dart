import 'package:brasiltransparenteapp/data/models/cidade_model.dart';

class Estado{
  String nome;
  String sigla;
  List<Cidade> cidades;

  Estado({this.nome,this.sigla, this.cidades});

  factory Estado.fromJson(Map<String, dynamic> json){
    return Estado
    (nome: json['nome'],
      sigla: json['sigla']
    );
  }

  
}