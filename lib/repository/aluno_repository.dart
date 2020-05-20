import 'package:fiap/models/aluno_model.dart';
import 'package:fiap/repository/database_helper.dart';

class AlunoRepository {
  // Instancia do Database Helper
  DatabaseHelper _databaseHelper;

  // Construtor
  AlunoRepository() {
    _databaseHelper = new DatabaseHelper();
  }

  Future<List<AlunoModel>> findAll() async {
    var connection = await _databaseHelper.connection;
    var result = await connection.query(
      "AlunoModel",
      columns: [
        "id",
        "nome",
        "sobrenome",
        "turma",
        "presenca",
      ],
    );

    // Converte a lista de Maps para Lista de alunos
    List<AlunoModel> listaAlunos = new List<AlunoModel>();
    for (Map i in result) {
      listaAlunos.add(AlunoModel.fromMap(i));
    }

    return listaAlunos;
  }

  Future<int> create(AlunoModel alunoModel) async {
    var connection = await _databaseHelper.connection;
    var result = await connection.insert(
      "AlunoModel",
      alunoModel.toMap(),
    );
    return result;
  }

  Future<int> createRaw(AlunoModel alunoModel) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " INSERT INTO AlunoModel ( " +
        "  nome , " +
        "  sobrenome , " +
        "  turma , " +
        "  presenca ) " +
        "VALUES ( " +
        "    '${alunoModel.nome}' , " +
        "    '${alunoModel.sobrenome}' , " +
        "    ${alunoModel.turma}, " +
        "    '${alunoModel.presenca}' " +
        "  ) ";

    var result = await connection.rawInsert(sqlCommand);
    return result;
  }

  Future<AlunoModel> get(int id) async {
    var connection = await _databaseHelper.connection;
    List<Map> results = await connection.query(
      "AlunoModel",
      columns: [
        "id",
        "nome",
        "sobrenome",
        "turma",
        "presenca",
      ],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.length > 0) {
      return AlunoModel.fromMap(
        results.first,
      );
    } else {
      return null;
    }
  }

  Future<AlunoModel> getRaw(int id) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = "SELECT * FROM AlunoModel WHERE ID = $id  ";

    var results = await connection.rawQuery(sqlCommand);
    if (results.length > 0) {
      return new AlunoModel.fromMap(results.first);
    } else {
      return null;
    }
  }

  Future<int> update(AlunoModel alunoModel) async {
    var connection = await _databaseHelper.connection;
    return await connection.update(
      "AlunoModel",
      alunoModel.toMap(),
      where: "id = ?",
      whereArgs: [alunoModel.id],
    );
  }

  Future<int> updateRaw(AlunoModel alunoModel) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand = " UPDATE AlunoModel SET  " +
        "  nome = '${alunoModel.nome}' , " +
        "  sobrenome = '${alunoModel.sobrenome}' , " +
        "  turma = ${alunoModel.turma} , " +
        "  presenca = ${alunoModel.presenca} , " +
        " WHERE id = ${alunoModel.id} ";

    var result = await connection.rawUpdate(sqlCommand);
    return result;
  }

  Future<void> delete(AlunoModel alunoModel) async {
    var connection = await _databaseHelper.connection;
    return await connection.delete(
      "AlunoModel",
      where: "id = ?",
      whereArgs: [alunoModel.id],
    );
  }

  Future<void> deleteRaw(AlunoModel alunoModel) async {
    var connection = await _databaseHelper.connection;
    var sqlCommand =
        " DELETE FROM AlunoModel   " + " WHERE id = ${alunoModel.id} ";

    var result = await connection.rawDelete(sqlCommand);
    return result;
  }
}