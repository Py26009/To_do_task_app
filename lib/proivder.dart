import 'package:flutter/cupertino.dart';
import 'package:untitled/TasksModel.dart';
import 'package:untitled/dbHelper.dart';

class dbprovider extends ChangeNotifier{
  dbHelper DBHelper = dbHelper.getInstance();
  List<TaskModel> _mtasks = [];

  void addTask({required TaskModel task})async{
   bool check = await DBHelper.addTask(task);

   if (check){
    _mtasks =  await DBHelper.fetchAllTasks();
    notifyListeners();
   }
  }
  List<TaskModel> getAllTasks() => _mtasks;
}