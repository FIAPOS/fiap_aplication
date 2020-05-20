import 'dart:convert';

class TrabalhoModel {
  int id;
  String nome;
  String nota;
  String comentario;
  String integrantes;

  TrabalhoModel({
    this.id,
    this.nome,
    this.nota,
    this.comentario,
    this.integrantes,
  });

  factory TrabalhoModel.fromJson(String str) =>
      TrabalhoModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TrabalhoModel.fromMap(Map<String, dynamic> json) => TrabalhoModel(
        id: json["id"],
        nome: json["nome"],
        nota: json["nota"],
        comentario: json["comentario"],
        integrantes: json["integrantes"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nome": nome,
        "nota": nota,
        "comentario": comentario,
        "integrantes": integrantes,
      };
}