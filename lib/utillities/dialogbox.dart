// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:to_do_app/utillities/mybutton.dart';

class DialogBox extends StatelessWidget {
  VoidCallback OnSave;
  VoidCallback Oncancel;
  final controller;
  DialogBox({super.key, required this.controller, required this.OnSave, required this.Oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hoverColor: const Color.fromARGB(255, 27, 160, 177),
                  hintText: 'Add a new task'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyButton(text: "Save ", onPressed: OnSave),
                const SizedBox(
                  width: 6,
                ),
                MyButton(text: "Cancel ", onPressed:Oncancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
