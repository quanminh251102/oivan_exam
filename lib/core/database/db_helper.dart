import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'bookmarked_users.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE bookmarks(userId INTEGER PRIMARY KEY)',
        );
      },
    );
  }

  Future<void> bookmarkUser(int userId) async {
    final db = await database;
    await db.insert('bookmarks', {'userId': userId},
        conflictAlgorithm: ConflictAlgorithm.ignore);
  }

  Future<void> unbookmarkUser(int userId) async {
    final db = await database;
    await db.delete('bookmarks', where: 'userId = ?', whereArgs: [userId]);
  }

  Future<List<int>> getBookmarkedUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query('bookmarks');
    return result.map((row) => row['userId'] as int).toList();
  }

  Future<bool> isBookmarked(int userId) async {
    final db = await database;
    final result = await db.query('bookmarks',
        where: 'userId = ?', whereArgs: [userId], limit: 1);
    return result.isNotEmpty;
  }
}
