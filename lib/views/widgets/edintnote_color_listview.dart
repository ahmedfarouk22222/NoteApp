import 'package:flutter/material.dart';
import 'package:noteapp/Models/note_model.dart';
import 'package:noteapp/constants.dart';
import 'package:noteapp/views/widgets/colors_listview.dart';

class EditnoteColorListView extends StatefulWidget {
  const EditnoteColorListView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditnoteColorListView> createState() => _EditnoteColorListViewState();
}

class _EditnoteColorListViewState extends State<EditnoteColorListView> {
  late int currentindex;
  @override
  void initState() {
    currentindex = kColors.indexOf(
      Color(widget.note.color),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: kColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  currentindex = index;
                  widget.note.color = kColors[index].value;
                  setState(() {});
                },
                child: Colorsitem(
                  color: kColors[index],
                  isactive: currentindex == index,
                ),
              ),
            );
          }),
    );
  }
}
