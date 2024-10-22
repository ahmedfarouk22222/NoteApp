
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/constants.dart';


part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  fetchAllNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
