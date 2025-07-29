import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/character_model.dart';

class LocalDataSource {
  static Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final path = join(await getDatabasesPath(), 'favorites.db');
    return openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE favorites(
          id INTEGER PRIMARY KEY,
          name TEXT,
          species TEXT,
          gender TEXT,
          origin TEXT,
          location TEXT,
          image TEXT
        )
      ''');
    });
  }

  Future<void> addFavorite(CharacterModel model) async {
    final db = await database;
    await db.insert('favorites', model.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> removeFavorite(int id) async {
    final db = await database;
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<CharacterModel>> getFavorites() async {
    final db = await database;
    final result = await db.query('favorites');
    return result.map((e) => CharacterModel.fromMap(e)).toList();
  }
}
