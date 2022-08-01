import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_notes/presentation/bloc/note_bloc.dart';

import '../../data/models/note.dart';
import '../widgets/note_app_bar.dart';
import 'note_detail_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getNoteAppBar(context),
        body: BlocBuilder<NoteBloc, NoteState>(
          builder: (context, state) {
            if (state is NotesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is NotesLoaded) {
              return Column(
                children: [
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: state.notes.length,
                      itemBuilder: (context, count) => ListTile(
                        leading: CircleAvatar(child: Text(state.notes[count].id.toString())),
                          title: Text(state.notes[count].title),
                          subtitle: Text(state.notes[count].description),
                          trailing: IconButton(
                            onPressed: () => context
                                .read<NoteBloc>()
                                .add(DeleteNote(state.notes[count])),
                            icon: const Icon(Icons.remove),
                          ),
                          onTap: () {
                            _getNote(context, state.notes[count]);
                          } 
                          ))
                ],
              );
            } else {
              return const Center(child: Text('Error'),);
            }
          },
        ));
  }

  void _getNote(context, Note note) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => NoteDetailView(note: note,)));
  }
}
