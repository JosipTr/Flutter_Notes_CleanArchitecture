import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_notes/injector.dart';
import 'package:free_notes/presentation/bloc/note_bloc.dart';
import 'package:free_notes/presentation/views/home_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NoteBloc>(
      create: (_) => injector()..add(LoadNotes()),
      child: const MaterialApp(
        home: HomeView()
      ),
    );
  }
}