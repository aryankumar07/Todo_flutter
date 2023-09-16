import 'package:hive/hive.dart';

class ToDoDatabase{

  List toDoList = [];

  final _mybox = Hive.box('Mybox');

  void createInitialData(){
    toDoList = [
      ["main body",false],
      ["do exercise",false]
    ];
  }

  void loadData(){
    toDoList = _mybox.get("TODOLIST");
  }

  void updateDatabase(){
    _mybox.put("TODOLIST", toDoList);
  }

}