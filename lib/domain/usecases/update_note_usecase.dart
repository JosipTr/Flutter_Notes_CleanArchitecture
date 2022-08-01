import 'package:dartz/dartz.dart';
import 'package:free_notes/domain/repositories/note_repository.dart';

import '../../data/models/note.dart';

class UpdateNoteUseCase {
  final NoteRepository repository;

  UpdateNoteUseCase(this.repository);

  Future<Either<Exception, void>> call(Note note) async {
    return await repository.updateNote(note);
  }
}