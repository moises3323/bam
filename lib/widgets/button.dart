import 'package:flutter/material.dart';

class ButtonStyled extends StatelessWidget {
  final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20), primary: Colors.black);
  final Function onPressed;
  final String textButton;
  final double bottom;

  ButtonStyled(
      {Key? key,
      required this.onPressed,
      required this.textButton,
      this.bottom = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 340,
        height: 56,
        margin: EdgeInsets.only(bottom: bottom),
        child: ElevatedButton(
          style: style,
          onPressed: () => onPressed(),
          child: Text(textButton),
        ),
      ),
    );
  }
}
