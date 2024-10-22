import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  Color color=const Color(0xff8CB369);
  addnote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
