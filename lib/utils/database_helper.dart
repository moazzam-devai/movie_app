import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'movies.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE watchlist (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
   
          api_source TEXT,
          movieid INTEGER
        )
      ''');
      },
    );
  }

  Future<int> insertMovie(Map<String, dynamic> movie) async {
    final db = await database;
    return db.insert('watchlist', movie);
  }

  Future<List<Map<String, dynamic>>> getAllMovies() async {
    final db = await database;
    return db.query('watchlist');
  }
}
