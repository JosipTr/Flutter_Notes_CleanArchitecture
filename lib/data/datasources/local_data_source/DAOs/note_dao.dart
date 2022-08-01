import 'package:floor/floor.dart';
import 'package:free_notes/data/models/note.dart';

@dao
abstract class NoteDao {
  @Query('SELECT * FROM Note')
  Future<List<Note>> getAllNotes();

  @Query('SELECT FROM Note')
  Future<Note?> getNote(Note note);

  @delete
  Future<void> deleteNote(Note note);

  @insert
  Future<void> addNote(Note note);
}