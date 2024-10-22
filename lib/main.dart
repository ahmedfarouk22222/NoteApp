import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/block_observe.dart';
import 'package:noteapp/constants.dart';
import 'package:noteapp/cubits/notes_cubit/notes_cubit.dart';
import 'package:noteapp/views/notes_views.dart';

void main() async {
  Bloc.observer = SimpleBlockObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => const NotesApp(), // Wrap your app
  ));
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
        debugShowCheckedModeBanner: false,
        home: const NotesView(),
      ),
    );
  }
}
