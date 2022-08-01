import 'package:dartz/dartz.dart';
import 'package:free_notes/domain/repositories/note_repository.dart';

import '../../data/models/note.dart';

class GetNoteUseCase {
  final NoteRepository repository;

  GetNoteUseCase(this.repository);

  Future<Either<Exception, Note>> call(Note note) async {
    return await repository.getNote(note);
  }
}