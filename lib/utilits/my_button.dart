import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{

MyButton({super.key,required this.onPressed,required this.text});

final String text;
VoidCallback onPressed;

@override
  Widget build(context) {

    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
    child: Text(text),
    );
  }

}