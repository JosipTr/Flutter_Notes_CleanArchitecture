import 'package:dartz/dartz.dart';
import 'package:free_notes/data/models/note.dart';

abstract class NoteRepository {
  Future<Either<Exception, List<Note>>> getAllNotes();
  Future<Either<Exception, Note?>> getNote(int id);
  Future<Either<Exception, void>> addNote(Note note);
  Future<Either<Exception, void>> deleteNote(Note note);
  Future<Either<Exception, void>> updateNote(Note note);
}