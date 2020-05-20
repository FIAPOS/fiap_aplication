import 'dart:convert';

class AlunoModel {
  int id;
  String nome;
  String sobrenome;
  String turma;
  String presenca;

  AlunoModel({
    this.id,
    this.nome,
    this.sobrenome,
    this.turma,
    this.presenca,
  });

  factory AlunoModel.fromJson(String str) =>
      AlunoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AlunoModel.fromMap(Map<String, dynamic> json) => AlunoModel(
        id: json["id"],
        nome: json["nome"],
        sobrenome: json["sobrenome"],
        turma: json["turma"],
        presenca: json["presenca"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "sobrenome": sobrenome,
        "turma": turma,
        "presenca": presenca,
      };
}
