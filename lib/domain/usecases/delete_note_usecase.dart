import 'package:dartz/dartz.dart';
import 'package:free_notes/domain/repositories/note_repository.dart';

import '../../data/models/note.dart';

class DeleteNoteUseCase {
  final NoteRepository repository;

  DeleteNoteUseCase(this.repository);

  Future<Either<Exception, void>> call(Note note) async {
    return await repository.deleteNote(note);
  }
}