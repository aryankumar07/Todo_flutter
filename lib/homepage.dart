import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/databaseFloder/todo_database.dart';
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

  final _mybox = Hive.box('Mybox');
  ToDoDatabase db = ToDoDatabase();

  final _controller = TextEditingController();

  @override
  void initState() {

    if(_mybox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
      db.loadData();
    }

    super.initState();
  }



  void checkboxchanged(bool? value,int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text,false]);
      _controller.clear();
      Navigator.of(context).pop();
    });
    db.updateDatabase();
  }

  void createTask(){
    showDialog(context: context,
     builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () {
          Navigator.of(context).pop();
        },

      );
     });
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
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
        itemCount: db.toDoList.length,
        itemBuilder: (ctx,index) {
          return ToDoTitle(taskName: db.toDoList[index][0],
           taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkboxchanged(value, index),
            deleteFunction: (context) => deleteTask(index),
            );
        }
        )
    );
  }

}