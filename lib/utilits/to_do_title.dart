import 'dart:ffi';

import 'package:flutter/material.dart';

class ToDoTitle extends StatelessWidget{
  ToDoTitle({super.key,required this.taskName,
  required this.taskCompleted,
  required this.onChanged});

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  @override 
  Widget build(context) {

    return Padding(
      padding: const EdgeInsets.only(left:24,right: 24,top: 24),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12)
          ),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
             onChanged: onChanged,
             activeColor: Colors.black,
             ),
            Text(
              taskName,
              style: TextStyle(decoration: taskCompleted 
              ? TextDecoration.lineThrough 
              : TextDecoration.none ),
              ),
          ],
        ),
      ),
    );
  }
}