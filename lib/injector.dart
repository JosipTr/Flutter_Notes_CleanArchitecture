import 'package:free_notes/data/datasources/local_data_source/app_database.dart';
import 'package:free_notes/domain/repositories/note_repository.dart';
import 'package:free_notes/domain/usecases/add_note_usecase.dart';
import 'package:free_notes/domain/usecases/delete_note_usecase.dart';
import 'package:free_notes/domain/usecases/get_all_notes_usecase.dart';
import 'package:free_notes/domain/usecases/get_note_usecase.dart';
import 'package:free_notes/presentation/bloc/note_bloc.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/note_repository_impl.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  injector.registerSingleton(database);

  injector.registerSingleton<NoteRepository>(
    NoteRepositoryImpl(injector())
  );

  injector.registerSingleton<AddNoteUseCase>(
    AddNoteUseCase(injector())
  );

  injector.registerSingleton<GetAllNotesUseCase>(
    GetAllNotesUseCase(injector())
  );

  injector.registerSingleton<DeleteNoteUseCase>(
    DeleteNoteUseCase(injector())
  );

  injector.registerSingleton<GetNoteUseCase>(
    GetNoteUseCase(injector())
  );

  injector.registerFactory<NoteBloc>(
    () => NoteBloc(injector(), injector(), injector(), injector())
    );
}
