import 'dart:developer';

import 'package:iug_app/model/TExercises.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  late Database database;
  final String tableName = 'exercises';

  initDatabase() async {
    // Get a reference to the database path
    final String databasePath = await getDatabasesPath();
    final String path = databasePath + 'sport.db';

    // Open the database
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // Create the "exercises" table
      await db.execute('''
      CREATE TABLE $tableName (
        id INTEGER PRIMARY KEY,
        name TEXT,
        image TEXT,
       isTimer BOOLEAN,
        timer INTEGER,
         steps INTEGER
      )
    ''');
    });
  }

 Future<int>  insertNewExe(TExercises tExercises) async {
    int rowNumber = -1;
    try {
      rowNumber = await database.insert(tableName, tExercises.toMap());
      log(rowNumber.toString());
    } catch (e) {
      log("row has not been inserted");
    }
    return rowNumber;
  }

  Future<List<TExercises>> getAllStudents() async {
    List<Map> results = await database.query(tableName);
    List<TExercises> students =
        results.map((e) => TExercises.fromMap(e)).toList();
    return students;
  }

  Future<TExercises> getStudentById(int id) async {
    List<Map> results = await database.query(tableName, where: 'id=$id');
    return TExercises.fromMap(results.first);
  }

  deleteStudent(int id) async {
    await database.delete(tableName, where: 'id=$id');
  }

  updateStudent(TExercises exercises) async {
    await database.update(tableName, exercises.toMap(),
        where: 'id=${exercises.id}');
  }
}
