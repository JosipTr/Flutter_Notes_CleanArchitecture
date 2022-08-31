part of 'note_bloc.dart';

abstract class NoteState {}

class NoteInitial extends NoteState {}

class NotesLoading extends NoteState {}

class NotesLoaded extends NoteState {
  final List<Note> notes;

  NotesLoaded(this.notes);
}