
class Estado{
  String nome;
  String sigla;


  Estado({this.nome,this.sigla});

  factory Estado.fromJson(Map<String, dynamic> json){
    return Estado
    (
      nome: json['nome'],
      sigla: json['sigla']
    );
  }

  
}