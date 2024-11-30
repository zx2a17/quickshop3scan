import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../data/category_suggestions.dart';

part 'sqlite_db.g.dart';

// Sqflite database needs async initialisation to open the sqflite file on disk.
// This provider will be overridden in main.dart with the actual sqflite database instance.
@Riverpod(keepAlive: true)
sqflite.Database sqfliteDb(Ref ref) {
  throw UnimplementedError();
}

Future<sqflite.Database> openDatabase() async {
  return sqflite.openDatabase(
    'quickshop.db',
    version: 1,
    onCreate: _onCreateV1,
  );
}

Future _onCreateV1(sqflite.Database db, int version) async {
  final start = DateTime.now();
  await db.execute('''
    CREATE TABLE CategorySuggestions(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      token TEXT NOT NULL,
      name TEXT NOT NULL
    )
  ''');

  // Prepopulate the category suggestions table
  final batch = db.batch();
  for (final category in categorySuggestions) {
    for (final token in category.split(' ')) {
      if (token == '&' || token == '-' || token.isEmpty) continue;
      batch.insert('CategorySuggestions', {'token': token.toLowerCase(), 'name': category});
    }
  }
  await batch.commit(noResult: true);
  final completed = DateTime.now();
  print('QSLog: V1 Database creation took ${completed.difference(start).inMilliseconds}ms');
}
