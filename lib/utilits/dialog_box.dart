import 'package:flutter/material.dart';
import 'package:todo/utilits/my_button.dart';

class DialogBox extends StatelessWidget{

  DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  
  @override
  Widget build(context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new Task"
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(onPressed: onSave, text: "Save"),
                Spacer(),
                MyButton(onPressed: onCancel, text: "Cancel")
              ],
            )
          ],
        ),
      ),
    );
  }

}