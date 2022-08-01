part of 'note_bloc.dart';

abstract class NoteEvent {}

class LoadNotes extends NoteEvent {
  final List<Note> notes;

  LoadNotes(this.notes);
}

class AddNote extends NoteEvent {
  final Note note;

  AddNote(this.note);
}

class DeleteNote extends NoteEvent {
  final Note note;

  DeleteNote(this.note);
}

class GetNote extends NoteEvent {
  final int id;

  GetNote(this.id);
}
