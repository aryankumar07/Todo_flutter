import 'package:flutter/material.dart';
import 'package:todo/utilits/dialog_box.dart';
import 'package:todo/utilits/to_do_title.dart';

class HomePage extends  StatefulWidget{
  HomePage({super.key});


  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}


class _HomePageState extends State<HomePage>{

  List toDoList = [
    ["Main Body",false],
    ["Secondary Body",true],
  ];

  void checkboxchanged(bool? value,int index){
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createTask(){
    showDialog(context: context,
     builder: (context) {
      return DialogBox();
     });
  }

  @override
  Widget build(context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 225, 130),
      appBar: AppBar(
        title: Text("To Do"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        child: Icon(Icons.add),
        ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (ctx,index) {
          return ToDoTitle(taskName: toDoList[index][0],
           taskCompleted: toDoList[index][1],
            onChanged: (value) => checkboxchanged(value, index));
        }
        )
    );
  }

}