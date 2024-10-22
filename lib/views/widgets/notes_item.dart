import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:noteapp/views/edit_note_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditNoteView(
              note: note,
            );
          }),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 24),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
              subtitle: Text(
                note.subTitle,
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: () {
                  note.delete();
                  BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note.date,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
