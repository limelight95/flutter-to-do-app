// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/data/dtabse.dart';
import 'package:to_do_app/utillities/dialogbox.dart';
import 'package:to_do_app/utillities/to_do_tile.dart';

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  @override
  State<ToDo> createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  // bool taskcomplete=false;
  // void taskstatus(taskcomplete){
  //   setState(() {
  //     taskcomplete=!taskcomplete;
  //   });
  final _mybox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  final _controller = TextEditingController();
  //
  @override
  void initState() {
    // TODO: implement initState

    if (_mybox.get("ToDoList") == null) {
      // Code to handle the case when "ToDoList" is null
      db.createInitalData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  // List todolist = [
  //   ['Make Tutorial', false],
  //   ['Make Tutorial', true],
  // ];

  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.UpdateDataBase();
  }

  void savenewtask() {
    setState(() {
      db.todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.UpdateDataBase();
  }

  void canceltask() {
    _controller.clear();
    Navigator.of(context).pop();
  }

  void createnewtask() {
    showDialog<void>(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          OnSave: savenewtask,
          Oncancel: canceltask,
        );
      },
    );
  }

  void deletetask(index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.UpdateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 226, 215, 188),
        appBar: AppBar(
          title: Center(
              child: Text(
            'TO_DO APP',
          )),
          elevation: 0,
          backgroundColor: Colors.yellow,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createnewtask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.todolist.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskname: db.todolist[index][0],
              taskcompleted: db.todolist[index][1],
              onChanged: (value) => checkboxchanged(value, index),
              deletefunction: ((context) => deletetask(index)),
            );
          },
        )
        // ListView(
        //   children: [
        //  ToDoTile(taskname: "make tutorial", taskcompleted: true ,onChanged: (p0) {},),
        //  ToDoTile(taskname: "make tutorial", taskcompleted: true ,onChanged: (p0) {},),

        //     ToDoTile(taskname: "make tutorial", taskcompleted: true ,onChanged: (p0) {},),
        //   ],

        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Container(
        //       child: Row(
        //         children: [
        //           Checkbox(value: taskcomplete, onChanged: taskstatus),
        //           Text("Manage Books"),
        //         ],
        //       ),
        //     ),

        // Container(
        //       child: Row(
        //         children: [
        //           Checkbox(value: taskcomplete, onChanged: taskstatus),
        //           Text("Manage Books"),
        //         ],
        //       ),
        //     )

        //   ],
        // ),
        );
  }
}
