//path_provider 2.0.9
//sqflite 2.0.2

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  //static property
  static Database? _database;
  //create the instance.... de mi clase
  //singletons con su constructor privado _()
  static final DBProvider db = DBProvider._();

  //constructor privado
  DBProvider._();

//  Future<Database> get database async => _database ??= await initDB();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    //Path de donde almacenaremos la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);
    //Creacion de la base de datos
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )
      ''');
    });
  }
}
