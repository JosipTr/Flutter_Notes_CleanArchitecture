import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_notes/data/models/note.dart';

import '../bloc/note_bloc.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.read<NoteBloc>();
    String title = '';
    String description = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Notes"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: "Title",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
                onChanged: (value) => title = value,
              ),
              TextField(
                maxLines: null,
                decoration: const InputDecoration(
                  labelText: "Content",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue)),
                ),
                onChanged: (value) => description = value,
              ),
              ElevatedButton(
                  onPressed: () {
                    provider.add(
                        AddNote(Note(title: title, description: description)));
                    context.read<NoteBloc>().add(LoadNotes());
                    Navigator.pop(context);
                  },
                  child: const Text('Add note'))
            ],
          ),
        ),
      ),
    );
  }
}
