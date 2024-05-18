// ignore_for_file: prefer_const_constructo

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;
  ToDoTile(
      {super.key,
      required this.taskname,
      required this.taskcompleted,
      required this.onChanged,required this.deletefunction,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
      child: Slidable(
        endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [SlidableAction(
              onPressed: deletefunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
            )]),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Checkbox(
                value: taskcompleted,
                onChanged: onChanged,
                activeColor: Colors.blue,
              ),
              Text(
                taskname,
                style: TextStyle(
                    decoration: taskcompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 215, 199, 26),
            border: Border.all(width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
