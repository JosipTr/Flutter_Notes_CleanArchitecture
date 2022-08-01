import 'package:dartz/dartz.dart';
import 'package:free_notes/data/models/note.dart';
import 'package:free_notes/domain/repositories/note_repository.dart';

class GetAllNotesUseCase {
  final NoteRepository repository;

  GetAllNotesUseCase(this.repository);

  Future<Either<Exception, List<Note>>> call() async {
    return await repository.getAllNotes();
  }
}