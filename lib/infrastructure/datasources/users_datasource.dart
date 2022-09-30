// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:man_memo_v2/infrastructure/model/user_detail.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user.dart';

class UsersDataSource {
  static final UsersDataSource _instance = UsersDataSource._internal();

  factory UsersDataSource() {
    return _instance;
  }

  UsersDataSource._internal();

  final List<UserData> _users = [
    UserData(name: "test0", userId: "0", createdAt: DateTime.now()),
    UserData(name: "test2", userId: "1", createdAt: DateTime.now()),
    UserData(name: "test1", userId: "2", createdAt: DateTime.now()),
    UserData(name: "test3", userId: "3", createdAt: DateTime.now()),
  ];

  /// 追加
  add(String name) async {
    _users.add(UserData(name: name, userId: "3", createdAt: DateTime.now()));
  }

  /// ユーザーリストを取得
  List<UserData> fetchList() {
    return _users;
  }

  /// 検索
  List<UserData> search(String searchText) {
    List<UserData> users = [];

    for (var user in _users) {
      if (user.name.contains(searchText)) users.add(user);
    }

    return users;
  }

  /// 詳細データ取得
  UserDetailData getDetail() {
    UserData userData = UserData(
      name: "test0",
      userId: "0",
      createdAt: DateTime.now(),
    );

    return UserDetailData(
      user: userData,
      age: 20,
      birthday: "birthday",
      birthplace: "birthplace",
      residence: "residence",
      holiday: 10,
      occupation: "occupation",
      memo: "memo",
    );
  }
}

class UsersDatabase {
  static final UsersDatabase instance = UsersDatabase._init();

  static Database? _database;

  UsersDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('users.db');
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
CREATE TABLE $tableUsers ( 
  ${UserFields.id} $idType, 
  ${UserFields.createdAt} $textType,
  ${UserFields.name} $textType,
  ${UserFields.icon} $textType,
  ${UserFields.age} $integerType,
  ${UserFields.birthday} $textType,
  ${UserFields.birthplace} $textType,
  ${UserFields.residence} $textType,
  ${UserFields.holiday} $integerType,
  ${UserFields.occupation} $textType,
  ${UserFields.memo} $textType
  )
''');
  }

  Future<User> create(User user) async {
    final db = await instance.database;

    final id = await db.insert(tableUsers, user.toJson());
    return user.copy(id: id);
  }

  Future<User> readUser(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableUsers,
      columns: UserFields.values,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<User>> readAllUsers() async {
    final db = await instance.database;

    const orderBy = '${UserFields.createdAt} ASC';
    final result = await db.query(tableUsers, orderBy: orderBy);

    return result.map((json) => User.fromJson(json)).toList();
  }

  Future<int> update(User user) async {
    final db = await instance.database;

    return db.update(
      tableUsers,
      user.toJson(),
      where: '${UserFields.id} = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableUsers,
      where: '${UserFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
