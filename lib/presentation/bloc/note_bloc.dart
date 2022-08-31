import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_notes/data/models/note.dart';
import 'package:free_notes/domain/usecases/add_note_usecase.dart';
import 'package:free_notes/domain/usecases/delete_note_usecase.dart';
import 'package:free_notes/domain/usecases/get_all_notes_usecase.dart';
import 'package:free_notes/domain/usecases/update_note_usecase.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final GetAllNotesUseCase _getAllNotesUseCase;
  final AddNoteUseCase _addNoteUseCase;
  final DeleteNoteUseCase _deleteNoteUseCase;
  final UpdateNoteUseCase _updateNoteUseCase;

  List<Note> notes = List.empty(growable: true);

  NoteBloc(this._getAllNotesUseCase, this._addNoteUseCase, this._deleteNoteUseCase, this._updateNoteUseCase) : super(NoteInitial()) {
    on<LoadNotes>(_onLoadNotes);
    on<AddNote>(_onAddNote);
    on<DeleteNote>(_onDeleteNote);
    on<UpdateNote>(_onUpdateNote);
  }

  void _onLoadNotes(LoadNotes event, Emitter<NoteState> emit) async{
    var either = await _getAllNotesUseCase.call();
    if (either.isRight()) {
      either.fold((l) => null, (r) => notes = r);
      emit(NotesLoaded(notes));
    }
  }

  void _onAddNote(AddNote event, Emitter<NoteState> emit) async{
    var either = await _addNoteUseCase.call(event.note);
    if (either.isRight()) {
      either.fold((l) => null, (r) => notes.add(event.note));
      emit(NotesLoaded(notes));
    }
  }

  void _onDeleteNote(DeleteNote event, Emitter<NoteState> emit) async{
    var either = await _deleteNoteUseCase.call(event.note);
    if (either.isRight()) {
      either.fold((l) => null, (r) => notes.remove(event.note));
      emit(NotesLoaded(notes));
    }
  }

  void _onUpdateNote(UpdateNote event, Emitter<NoteState> emit) async{
    var either = await _updateNoteUseCase.call(event.note);
    if (either.isRight()) {
      either.fold((l) => null, (r) {
        notes[notes.indexWhere((element) => element.id == event.note.id)] = event.note;
      } );
      emit(NotesLoaded(notes));
    }
  }
}
