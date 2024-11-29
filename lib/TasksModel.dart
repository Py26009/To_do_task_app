import 'package:untitled/dbHelper.dart';

class TaskModel {
  int ? id;
  String title;
  String comment;


  TaskModel({
    this.id,
    required this.title,
    required this.comment,
  });

  factory TaskModel.fromMap(Map<String , dynamic> map){
    return TaskModel(
          id: map[dbHelper.TASK_COLUMN_ID],
        title: map[dbHelper.TASK_COLUMN_TITLE],
        comment: map[dbHelper.TASK_COLUMN_COMMENT],

    );
  }

  Map<String, dynamic> toMap() {
    return {
      dbHelper.TASK_COLUMN_TITLE: title,
      dbHelper.TASK_COLUMN_COMMENT:comment,


    };
  }

}