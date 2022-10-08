// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/diary.dart';

class DiariesDatabase {
  static final DiariesDatabase instance = DiariesDatabase._init();

  static Database? _database;

  DiariesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('diaries.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableDiaries ( 
  ${DiaryFields.id} $idType, 
  ${DiaryFields.createdAt} $textType,
  ${DiaryFields.userIds} $textType,
  ${DiaryFields.title} $textType,
  ${DiaryFields.body} $integerType
  )
''');
  }

  Future<DiaryData> create(DiaryData diary) async {
    final db = await instance.database;

    final id = await db.insert(tableDiaries, diary.toJson());
    return diary.copy(id: id);
  }

  Future<DiaryData> readDiary(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableDiaries,
      columns: DiaryFields.values,
      where: '${DiaryFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return DiaryData.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<DiaryData>> readAllDiaries() async {
    final db = await instance.database;

    const orderBy = '${DiaryFields.createdAt} ASC';
    final result = await db.query(tableDiaries, orderBy: orderBy);

    return result.map((json) => DiaryData.fromJson(json)).toList();
  }

  Future<int> update(DiaryData user) async {
    final db = await instance.database;

    return db.update(
      tableDiaries,
      user.toJson(),
      where: '${DiaryFields.id} = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableDiaries,
      where: '${DiaryFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
