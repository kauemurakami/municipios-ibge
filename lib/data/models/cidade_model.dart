import 'package:meta/meta.dart';
class Cidade{
  String nome;
  String estado;

  Cidade({@required this.nome, this.estado});

  static List<Cidade> getCidades(){
    return <Cidade>[
      Cidade(nome: "São Paulo"),
      Cidade(nome: "Paraná"),
      Cidade(nome: "Santa Catarina"),
      Cidade(nome: "Rio de Janeiro"),
      Cidade(nome: "Minas Gerais"),
    ];
  }
}