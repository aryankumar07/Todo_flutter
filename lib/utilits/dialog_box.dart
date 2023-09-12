import 'package:flutter/material.dart';
import 'package:todo/utilits/my_button.dart';

class DialogBox extends StatelessWidget{

  DialogBox({super.key});
  
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
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new Task"
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(onPressed: () {}, text: "Save"),
                Spacer(),
                MyButton(onPressed: () {}, text: "Cancel")
              ],
            )
          ],
        ),
      ),
    );
  }

}