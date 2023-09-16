import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTitle extends StatelessWidget{
  ToDoTitle({super.key,required this.taskName,
  required this.taskCompleted,
  required this.onChanged,
  required this.deleteFunction
  });

  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  @override 
  Widget build(context) {

    return Padding(
      padding: const EdgeInsets.only(left:24,right: 24,top: 24),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
           children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
           ]),
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
      ),
    );
  }
}