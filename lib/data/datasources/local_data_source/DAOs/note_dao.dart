import 'package:floor/floor.dart';
import 'package:free_notes/data/models/note.dart';

@dao
abstract class NoteDao {
  @Query('SELECT * FROM Note')
  Future<List<Note>> getAllNotes();

  @Query('SELECT FROM Note WHERE id = :id')
  Future<Note?> getNote(int id);

  @delete
  Future<void> deleteNote(Note note);

  @insert
  Future<void> addNote(Note note);

  @update
  Future<void> updateNote(Note note);
}