import 'package:meta/meta.dart';
class Estado{
  String nome;
  String sigla;
  String nmrIBGE;

  Estado({@required this.nome,this.sigla,this.nmrIBGE});

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