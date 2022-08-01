import 'package:free_notes/data/datasources/local_data_source/app_database.dart';
import 'package:free_notes/data/models/note.dart';
import 'package:dartz/dartz.dart';
import 'package:free_notes/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final AppDatabase _appDatabase;

  NoteRepositoryImpl(this._appDatabase);

  @override
  Future<Either<Exception, void>> addNote(Note note) async{
    try{
      return Right(await _appDatabase.noteDao.addNote(note));
    } catch (e) {
      return Left(Exception());
    }
  }

  @override
  Future<Either<Exception, void>> deleteNote(Note note) async {
    try{
      return Right(await _appDatabase.noteDao.deleteNote(note));
    } catch (e) {
      return Left(Exception());
    }
  }

  @override
  Future<Either<Exception, List<Note>>> getAllNotes() async {
    try{
      return Right(await _appDatabase.noteDao.getAllNotes());
    } catch (e) {
      return Left(Exception());
    }
  }

  @override
  Future<Either<Exception, Note?>> getNote(int id) async {
    try{
      return Right(await _appDatabase.noteDao.getNote(id));
    } catch (e) {
      return Left(Exception());
    }
  }

}