import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/diaglog_box.dart';
import 'package:todoapp/util/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// reference the hive box
final _myBox= Hive.box("mybox");
ToDoDatabase db= ToDoDatabase();

@override
  void initState() {
    // If this is 1st time ever opening the app the create default data
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
      // there already exist data
      db.loadData();
    }
    super.initState();
  }

  // Text controller
  final _controller=TextEditingController();

  // List of ToDo task
  // List doDoList=[
  //   ["Make tutorial", false],
  //    ["Reading", false],
  //    ["Coding",false]
  // ];

  // Checkbox is tapped
  void chekBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1]= !db.toDoList[index][1];

    });
   db.updateDatabase();
  }

  // save new task
  void saveNewTask(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();


  }
  
  //  Create new Task
  void createNewTask(){
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: ()=> Navigator.of(context).pop(),
        );
      },
      );
  }

  // Delete task
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: const Text("TO DO"),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (BuildContext context, int index) { 
          return ToDoTile(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1],
             onChanged: (value) => chekBoxChanged(value, index),
             detelteFunction: (context)=> deleteTask(index),
             );
         },
        
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed:createNewTask,
        child: const Icon(Icons.add),
        ),
    );
  }
}