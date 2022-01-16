import 'package:flutter/material.dart';

class InputStyle {
  static InputDecoration decoration({String? hintText}) => (InputDecoration(
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.zero),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.zero),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ));
}
