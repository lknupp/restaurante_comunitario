class Unidade {
  String idUnidade;
  String nome;
  String endereco;
  String telefone;
  String imageUrl;
  bool temCafe;
  bool temAlmoco;
  bool temJantar;

  Unidade(
      {required this.idUnidade,
      required this.nome,
      required this.endereco,
      required this.telefone,
      required this.imageUrl,
      required this.temCafe,
      required this.temAlmoco,
      required this.temJantar});

  factory Unidade.fromJson(Map<String, dynamic> json) {
    return Unidade(
      idUnidade: json['id'],
      nome: json['unidade'],
      endereco: json['endereco'],
      telefone: json['telefone'],
      imageUrl: json['url'],
      temCafe: json['temCafe'],
      temAlmoco: json['temAlmoco'],
      temJantar: json['temJanta'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': idUnidade,
      'unidade': nome,
      'endereco': endereco,
      'telefone': telefone,
      'temCafe': temCafe,
      'temAlmoco': temAlmoco,
      'temJanta': temJantar,
      'url': imageUrl,
    };
  }

  @override
  String toString() {
    return 'Unidade{idUnidade: $idUnidade, nome: $nome, endereco: $endereco, telefone: $telefone, imageUrl: $imageUrl, temCafe: $temCafe, temAlmoco: $temAlmoco, temJantar: $temJantar}';
  }
}
