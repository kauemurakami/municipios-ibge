import 'package:brasiltransparenteapp/data/models/cidade_model.dart';
import 'package:meta/meta.dart';
class Estado{
  String nome;
  String sigla;
  String nmrIBGE;
  List<Cidade> cidades;

  Estado({@required this.nome,this.sigla,this.nmrIBGE, this.cidades});

  static List<Estado> getEstados(){
    return <Estado>[
      Estado(nome: "São Paulo"),
      Estado(nome: "Paraná"),
      Estado(nome: "Santa Catarina"),
      Estado(nome: "Rio de Janeiro"),
      Estado(nome: "Minas Gerais"),
    ];
  }
}