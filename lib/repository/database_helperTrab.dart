import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelperTrab {
  // Instancia do SQFLite Database
  static Database _database;

  // Instancia da classe Helper
  static final DatabaseHelperTrab _instance = DatabaseHelperTrab._internal();

  // Fábrica de construtor
  factory DatabaseHelperTrab() {
    return _instance;
  }

  // Construtor nomeado 
  DatabaseHelperTrab._internal();

  

  // Abre conexão com o banco
  Future<Database> get connection async {
    if (_database == null) {
      _database = await _createDatabase();
    }
    return _database;
  }

  Future<Database> _createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'trabalho.db');

    var database = await openDatabase(
      dbPath,
      version: 1,
      onCreate: _createTables,
    );

    return database;
  }

  void _createTables(Database database, int version) async {
    // Criando a tabela de alunos
    await database.execute(
      '''
      CREATE TABLE TrabalhoModel (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        nome TEXT,
        nota TEXT,
        comentario TEXT,
        integrantes TEXT
      )
      ''',
    );
  }
  
}
