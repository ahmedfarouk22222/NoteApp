import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/constants.dart';
import 'package:noteapp/cubits/addNote_cubit/add_note_cubit.dart';

class Colorsitem extends StatelessWidget {
  const Colorsitem({super.key, required this.isactive, required this.color});
  final bool isactive;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isactive
        ? CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: CircleAvatar(radius: 33, backgroundColor: color),
          )
        : CircleAvatar(
            radius: 35,
            backgroundColor: color,
          );
  }
}

class ColorsListview extends StatefulWidget {
  const ColorsListview({
    super.key,
  });

  @override
  State<ColorsListview> createState() => _ColorsListviewState();
}

class _ColorsListviewState extends State<ColorsListview> {
  int currentindex = 0;
 
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
                  BlocProvider.of<AddNoteCubit>(context).color = kColors[index];
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
