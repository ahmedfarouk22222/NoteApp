import 'package:flutter/material.dart';


import 'package:noteapp/views/widgets/add_note_bottomsheet.dart';
import 'package:noteapp/constants.dart';
import 'package:noteapp/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              context: context,
              builder: (context) {
                return const AddNoteBottomSheet();
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: const NotesViewBody(),
    );
  }
}
