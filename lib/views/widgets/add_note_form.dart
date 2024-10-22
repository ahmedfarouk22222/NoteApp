import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/cubits/addNote_cubit/add_note_cubit.dart';
import 'package:noteapp/views/widgets/colors_listview.dart';
import 'package:noteapp/views/widgets/custom_button.dart';
import 'package:noteapp/views/widgets/custom_textfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onsaved: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            onsaved: (value) {
              subTitle = value;
            },
            hint: 'Content',
            maxlines: 5,
          ),
           const SizedBox(
            height: 30,
          ),
        const  ColorsListview(),
          const SizedBox(
            height: 30,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomBotton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentdate = DateTime.now();
                    var formatcurrentdate =
                        DateFormat.yMEd().format(currentdate);
                    var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formatcurrentdate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNoteCubit>(context).addnote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
