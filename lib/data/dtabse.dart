import 'package:hive/hive.dart';

class ToDoDataBase {
  List todolist = [];
  final _mybox = Hive.box('mybox');

  void createInitalData() {
    todolist = [
      ['Make Tutorial', false],
      ['Do Exercise', true],
    ];
  }

  void loadData() {
    todolist = _mybox.get("ToDoList");
  }

  void UpdateDataBase() {
    _mybox.put("ToDoList",todolist);
  }
}
