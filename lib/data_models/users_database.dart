import 'package:big_two_calculator/models/user.dart';
import 'package:big_two_calculator/models/user_stats.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabase {
  static UserDatabase _userDatabaseInstance;

  Database _userDatabase;

  static final String _createUserDatabase =
      "CREATE TABLE user (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT , dateAdded INTEGER, lastPlayed INTEGER, played INTEGER)";

  static final String _createUserStatsDatabase =
      "CREATE TABLE userStat (id INTEGER PRIMARY KEY, totalWinnings REAL, biggestWin REAL, biggestLose REAL, roundsPlayed INTEGER, totalDoubleToOthers INTEGER, totalDoubleToUser INTEGER, totalTripleToOthers INTEGER, totalTripleToUser INTEGER, mostDoublesInAGameToOthers INTEGER, mostDoublesInAGameToUser INTEGER, mostTriplesInAGameToOthers INTEGER, mostTriplesInAGameToUser INTEGER)";

  UserDatabase._createInstance();

  factory UserDatabase() {
    if (_userDatabaseInstance == null) {
      _userDatabaseInstance = UserDatabase._createInstance();
    }
    return _userDatabaseInstance;
  }

  /// Returns the database object
  Future<Database> get database async {
    if (_userDatabase != null) {
      return _userDatabase;
    }
    _userDatabase = await getDatabaseInstance();
    return _userDatabase;
  }

  Future<Database> getDatabaseInstance() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'big_two_calc_user.db');
    return await openDatabase(path, version: 1, onCreate: _createDB, onUpgrade: _onUpgradeDB);
  }

  void _createDB(Database db, int version) async {
    await db.execute(_createUserDatabase);

    await db.execute(_createUserStatsDatabase);
  }

  void _onUpgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      //await db.execute("ALTER TABLE category ADD COLUMN position INTEGER DEFAULT 0");
    }
  }

  Future<void> insert(User user, UserStats userStats) async {
    //conflictAlgorithm: ConflictAlgorithm.replace,
    final Database db = await database;

    int userId = await db.insert('user', user.toMap());
    userStats.id = userId;
    await db.insert('userStat', userStats.toMap());
  }

  Future<int> update(User user) async {
    final Database db = await database;

    int resp = await db.update('user', user.toMap(), where: "id = ?", whereArgs: [user.id]);

    return resp;
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    final Database db = await database;

    return await db.query('user', orderBy: "lastPlayed DESC");
  }

  Future<List<Map<String, dynamic>>> getUserStat(int id) async {
    final Database db = await database;

    return await db.query('userStat', where: "id = ?", whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    final Database db = await database;

    int resp = await db.delete('user', where: "id = ?", whereArgs: [id]);

    return resp;
  }
}
