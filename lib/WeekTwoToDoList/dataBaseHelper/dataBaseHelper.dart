// ignore_for_file: unused_import, file_names

import 'package:flutter/material.dart';
import '../dataBaseHelper/model.dart';
import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class DatabaseHelper {

  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper.internal();
  // static late Database _db;
  Future<Database> createDAtabase() async {

    final _db = openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), 'notes.Db'),
      // When the database is first created, create a table to store dogs.
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'create table ToDo(ID integer primary key autoincrement,  content TEXT,noteDate TEXT,isChecked TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );
    //define the path to the database
  //   String path = join(await getDatabasesPath(), 'toDoDb');
  //   _db = await openDatabase(path, version: 1, onCreate: (Database db, int v) {
  //     //create tables
  //     return db.execute(
  //         'create table toDo(ID integer primary key autoincrement,  content TEXT)');
  //   });
  return _db;
  }

  Future<int> create(Model model) async {
    Database db = await createDAtabase();
    return db.insert('ToDo', model.toMap(),conflictAlgorithm: ConflictAlgorithm.replace,);
  }


  Future<List> allNotes() async {
    Database db = await createDAtabase();
    return db.query('ToDo',where: 'isChecked=?',whereArgs: ['false']);
  }
  Future<List> checkedNotes() async {
    Database db = await createDAtabase();
    return db.query('ToDo',where: 'isChecked=?',whereArgs: ['true']);
  }
  Future<int> delete(int id) async {
    Database db = await createDAtabase();
    return db.delete('ToDo', where: 'ID=?', whereArgs: [id]);
  }

  Future<int> edit(Model model) async {
    Database db = await createDAtabase();
    return await db.update('ToDo', model.toMap(),
        where: 'ID = ?', whereArgs: [model.id]);
  }
  Future<int> editCheck(Model model) async {
    Database db = await createDAtabase();
    return await db.update('ToDo', model.toMap(),
        where: 'ID = ?', whereArgs: [model.id]);
  }
}
