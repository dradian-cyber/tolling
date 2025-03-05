import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/toll_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('toll.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tolls (
        id TEXT PRIMARY KEY,
        location TEXT,
        amount REAL,
        timestamp TEXT
      )
    ''');
  }

  Future<void> insertToll(TollModel toll) async {
    final db = await database;
    await db.insert('tolls', toll.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<TollModel>> fetchAllTolls() async {
    final db = await database;
    final result = await db.query('tolls');
    return result.map((json) => TollModel.fromJson(json)).toList();
  }

  Future<void> clearDatabase() async {
    final db = await database;
    await db.delete('tolls');
  }
}
