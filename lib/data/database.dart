import 'package:hive/hive.dart';

class ToDoDatabase {
 List toDoList=[];

  // reference the box
  final _myBox= Hive.box('mybox');

  // run this method if this is 1st time ever opening this app
  void createInitialData(){
     toDoList=[
      ["Make tutorial", false],
      ["Do exercise", false]
     ];
  }
// Load the data from database
void loadData(){
  toDoList=_myBox.get("TODOLIST");
}

  // Update the database
  void updateDatabase(){
   _myBox.put("TODOLIST", toDoList);
  }
}