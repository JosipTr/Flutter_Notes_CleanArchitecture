import 'dart:async';
import 'package:floor/floor.dart';
import 'package:free_notes/data/datasources/local_data_source/DAOs/note_dao.dart';
import 'package:free_notes/data/models/note.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Note])
abstract class AppDatabase extends FloorDatabase {
  NoteDao get noteDao;
}