import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?) onChanged;
  Function(BuildContext?) detelteFunction;

   ToDoTile({
    super.key,
     required this.taskName,
      required this.taskCompleted,
       required this.onChanged,
       required this.detelteFunction
       });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: detelteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
              )
          ],
          ),
        child: Container(
         padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10)
          ),
          child: Row(
            children: [
              // checkbox
              Checkbox(value: taskCompleted, onChanged: onChanged),
        
              // task name
              Text(taskName, 
              style: (TextStyle(
                decoration: taskCompleted? TextDecoration.lineThrough : TextDecoration.none
              )),),
        
            ],
          ),
        ),
      ),
    );
  }
}