import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List<List<dynamic>> toDoList = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  void loadData() {
    final data = _myBox.get("TODOLIST");
    if (data != null) {
      toDoList = List<List<dynamic>>.from(
        (data as List).map((item) => List<dynamic>.from(item)),
      );
    }
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
