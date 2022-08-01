import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/note.dart';
import '../bloc/note_bloc.dart';

class NoteDetailView extends StatelessWidget {
  final Note note;
  const NoteDetailView({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyNotes'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          context.read<NoteBloc>().add(UpdateNote(note));
          context.read<NoteBloc>().add(LoadNotes());
          return true;
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  initialValue: note.title,
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                  onChanged: (value) => note.setTitle(value)
                  ),
                const SizedBox(height: 20),
                TextFormField(
                  initialValue: note.description,
                  onChanged: (value) => note.setDescription(value),
                  maxLines: null,
                  decoration: const InputDecoration(
                    labelText: "Description",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                  ),
                ),
              ]
            ),
            ),
          ),
        ),
      );
  }
}