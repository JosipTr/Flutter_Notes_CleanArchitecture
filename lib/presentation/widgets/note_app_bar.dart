import 'package:flutter/material.dart';
import 'package:free_notes/presentation/views/add_note_view.dart';

AppBar getNoteAppBar(BuildContext context) {
  return AppBar(
    title: const Text('MyNotes'),
    actions: [
    IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNoteView())), 
    icon: const Icon(Icons.add))
  ],
  );
}