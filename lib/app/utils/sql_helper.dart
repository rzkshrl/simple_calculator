import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE history(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      hitung TEXT,
      hasil TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('simplecalculator.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  //buat item/history
  static Future<int> createItem(String hitung, String? hasil) async {
    final db = await SQLHelper.db();
    final data = {'hitung': hitung, 'hasil': hasil};
    final id = await db.insert('history', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  //read item/history
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('history', orderBy: 'id');
  }

  //hapus history per id
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("history", where: "id = ?", whereArgs: [id]);
    } catch (e) {
      Get.snackbar("Error!", "Can't delete item.");
      debugPrint('$e');
    }
  }

  //hapus semua history all record
  static Future<void> deleteAllItem() async {
    final db = await SQLHelper.db();
    await db.delete('history');
    await db.close();
  }
}
