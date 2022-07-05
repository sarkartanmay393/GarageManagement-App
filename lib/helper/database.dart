// import 'package:sqflite/sqflite.dart' as sql;
// import 'package:path/path.dart' as path;
// import 'package:sqflite/sqlite_api.dart';

// class DatabaseHelper {
//   static Future<Database> database() async {
//     final dbPath = await sql.getDatabasesPath();
//     return sql.openDatabase(
//       path.join(dbPath, 'places.db'),
//       onCreate: (db, version) {
//         return db.execute(
//             'CREATE TABLE user_info (id TEXT PRIMARY KEY, title TEXT, image TEXT)');
//       },
//       version: 1,
//     );
//   }

//   static Future<void> insert(String table, Map<String, Object> data) async {
//     final sqlDB = await DatabaseHelper.database();
//     sqlDB.insert(
//       table,
//       data,
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   static Future<List<Map<String, dynamic>>> getData(String table) async {
//     final sqlDB = await DatabaseHelper.database();
//     return sqlDB.query(table);
//   }
// }
