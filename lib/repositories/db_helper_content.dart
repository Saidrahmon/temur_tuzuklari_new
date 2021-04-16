import 'dart:io';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:temur_tuzuklari_new/models/title_model.dart';

class DatabaseHelper {

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? db;

  Future<Database> get database async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "my_database.db");

    var exists = await databaseExists(path);

    if (!exists) {
      print("Creating new copy from asset >>>");

      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      ByteData data = await rootBundle.load(join("assets", "my_database.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database >>>");
    }
    db = await openDatabase(path, readOnly: true);
    return db!;
  }

  Future<List<TitleModel>> getAllTitles() async {
    final db = await database;
    var response = await db.rawQuery("SELECT * FROM content WHERE lang = 'oz'");
    List<TitleModel> list = response.map((c) => TitleModel.fromMap(c)).toList();
    return list;
  }

  Future<TitleModel> getStoryById(int chapterId) async{
    final db = await database;
    var response = await db.rawQuery("SELECT *FROM content WHERE chapter = '${chapterId}' AND lang = 'oz'");
    TitleModel titleModel = TitleModel.fromMap(response.first);
    return titleModel;
  }

  //
  // Future<InfoModel> getInfo(String lang) async{
  //   final db = await database;
  //   var response = await db.rawQuery("SELECT *FROM info WHERE lang = '${lang}'");
  //   InfoModel infoModel = InfoModel.fromMap(response.first);
  //   return infoModel;
  // }
}