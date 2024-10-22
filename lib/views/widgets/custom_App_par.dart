import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:noteapp/views/widgets/custom_search_icon.dart';

class CustomApppar extends StatelessWidget {
  const CustomApppar({Key? key, required this.title, required this.icon, this.onPressed})
      : super(key: key);
  final String title;
  final IconData icon;
   final void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 30),
        ),
        const Spacer(),
        CustomIcon(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
