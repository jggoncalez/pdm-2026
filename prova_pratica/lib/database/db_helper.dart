import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/item.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._internal();
  factory DbHelper() => instance;
  DbHelper._internal();

  static Database? _db;

  Future<Database> get database async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'prova_pratica.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE dados (
        id        INTEGER PRIMARY KEY AUTOINCREMENT,
        titulo    TEXT,
        descricao TEXT,
        data      TEXT
      )
    ''');
  }

  Future<int> insertItem(Item item) async {
    final db = await database;
    return await db.insert('dados', item.toMap());
  }

  Future<List<Item>> getItems() async {
    final db = await database;
    final maps = await db.query('dados', orderBy: 'titulo COLLATE NOCASE ASC');
    return maps.map((m) => Item.fromMap(m)).toList();
  }

  Future<int> updateItem(Item item) async {
    final db = await database;
    return await db.update(
      'dados',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteItem(int id) async {
    final db = await database;
    return await db.delete(
      'dados',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
