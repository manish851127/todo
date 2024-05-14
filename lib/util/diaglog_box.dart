import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todoapp/util/my_button.dart';
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({
    super.key,
    required this.controller,
    required this.onCancel,
    required this.onSave,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),

              hintText: "Add new task ",
        
            ),
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
            // save button
             MyButton(onPressed: onSave, text: "Save"),

            const SizedBox(width: 10,),

            // cancel button
              MyButton(onPressed: onCancel, text: "Cancel"),

          ],)
        ],),
      ),
    );
  }
}