import 'package:fiap/models/trabalho_model.dart';
import 'package:fiap/repository/database_helperTrab.dart';

class TrabalhosRepository {
  // Instancia do Database Helper
  DatabaseHelperTrab _databaseHelperTrab;

  // Construtor
  TrabalhosRepository() {
    _databaseHelperTrab = new DatabaseHelperTrab();
  }

  Future<List<TrabalhoModel>> findAll() async {
    var connection = await _databaseHelperTrab.connection;
    var result = await connection.query(
      "TrabalhoModel",
      columns: [
        "id",
        "nome",
        "nota",
        "comentario",
        "integrantes",
      ],
    );

    // Converte a lista de Maps para Lista de trabalhos
    List<TrabalhoModel> listaTrabalho = new List<TrabalhoModel>();
    for (Map i in result) {
      listaTrabalho.add(TrabalhoModel.fromMap(i));
    }

    return listaTrabalho;
  }

  Future<int> create(TrabalhoModel trabalhoModel) async {
    var connection = await _databaseHelperTrab.connection;
    var result = await connection.insert(
      "TrabalhoModel",
      trabalhoModel.toMap(),
    );
    return result;
  }

  Future<int> createRaw(TrabalhoModel trabalhoModel) async {
    var connection = await _databaseHelperTrab.connection;
    var sqlCommand = " INSERT INTO TrabalhoModel ( " +
        "  nome , " +
        "  nota , " +
        "  comentario , " +
        "  integrantes ) " +
        "VALUES ( " +
        "    '${trabalhoModel.nome}' , " +
        "    '${trabalhoModel.nota}' , " +
        "    '${trabalhoModel.comentario}', " +
        "    '${trabalhoModel.integrantes}' " +
        "  ) ";

    var result = await connection.rawInsert(sqlCommand);
    return result;
  }

  Future<TrabalhoModel> get(int id) async {
    var connection = await _databaseHelperTrab.connection;
    List<Map> results = await connection.query(
      "TrabalhoModel",
      columns: [
        "id",
        "nome",
        "nota",
        "comentario",
        "integrantes",
      ],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.length > 0) {
      return TrabalhoModel.fromMap(
        results.first,
      );
    } else {
      return null;
    }
  }

  Future<TrabalhoModel> getRaw(int id) async {
    var connection = await _databaseHelperTrab.connection;
    var sqlCommand = "SELECT * FROM TrabalhoModel WHERE ID = $id  ";

    var results = await connection.rawQuery(sqlCommand);
    if (results.length > 0) {
      return new TrabalhoModel.fromMap(results.first);
    } else {
      return null;
    }
  }

  Future<int> update(TrabalhoModel trabalhoModel) async {
    var connection = await _databaseHelperTrab.connection;
    return await connection.update(
      "TrabalhoModel",
      trabalhoModel.toMap(),
      where: "id = ?",
      whereArgs: [trabalhoModel.id],
    );
  }

  Future<int> updateRaw(TrabalhoModel trabalhoModel) async {
    var connection = await _databaseHelperTrab.connection;
    var sqlCommand = " UPDATE TrabalhoModel SET  " +
        "  nome = '${trabalhoModel.nome}' , " +
        "  nota = '${trabalhoModel.nota}' , " +
        "  comentario = '${trabalhoModel.comentario}' , " +
        "  integrantes = '${trabalhoModel.integrantes}' " +
        " WHERE id = ${trabalhoModel.id} ";

    var result = await connection.rawUpdate(sqlCommand);
    return result;
  }

  Future<void> delete(TrabalhoModel trabalhoModel) async {
    var connection = await _databaseHelperTrab.connection;
    return await connection.delete(
      "TrabalhoModel",
      where: "id = ?",
      whereArgs: [trabalhoModel.id],
    );
  }

  Future<void> deleteRaw(TrabalhoModel trabalhoModel) async {
    var connection = await _databaseHelperTrab.connection;
    var sqlCommand =
        " DELETE FROM TrabalhoModel   " + " WHERE id = ${trabalhoModel.id} ";

    var result = await connection.rawDelete(sqlCommand);
    return result;
  }
}