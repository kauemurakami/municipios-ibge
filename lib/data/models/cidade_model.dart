class Cidade{
  String nome;
  int id;

  Cidade({this.nome, this.id});

  static List<Cidade> getCidades(){
    return <Cidade>[
      Cidade(nome: "São Paulo"),
      Cidade(nome: "Paraná"),
      Cidade(nome: "Santa Catarina"),
      Cidade(nome: "Rio de Janeiro"),
      Cidade(nome: "Minas Gerais"),
    ];
  }

  factory Cidade.fromJson(Map<String, dynamic> json){
    return Cidade
    (nome: json['nome'],
    id: json['id'],
    );
  }

}