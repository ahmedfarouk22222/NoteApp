import 'package:flutter/material.dart';
import 'package:noteapp/views/widgets/custom_App_par.dart';
import 'package:noteapp/views/widgets/notes_listview.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CustomApppar(title: 'Notes', icon: Icons.search),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
