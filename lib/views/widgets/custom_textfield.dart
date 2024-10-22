import 'package:flutter/material.dart';
import 'package:noteapp/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.hint, this.maxlines = 1, this.onsaved, this.onChanged});
  final String hint;
  final int maxlines;
  final void Function(String?)? onsaved;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      onSaved: onsaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxlines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: kPrimaryColor),
        border: buidBorder(),
        enabledBorder: buidBorder(),
        focusedBorder: buidBorder(kPrimaryColor),
      ),
    );
  }
}

OutlineInputBorder buidBorder([color]) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: color ?? Colors.white,
    ),
  );
}
