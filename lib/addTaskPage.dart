import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/HomePage.dart';
import 'package:untitled/TasksModel.dart';
import 'package:untitled/dbHelper.dart';
import 'package:untitled/proivder.dart';

class addTask extends StatefulWidget{

  String appBarTitle;
  addTask(this.appBarTitle);

  @override
  State<addTask> createState() => _addTaskState(this.appBarTitle);
}

class _addTaskState extends State<addTask> {
  late dbHelper mydb;
   String appBarTitle;
  _addTaskState(this.appBarTitle);
  List<dynamic>listdata=[];
  TextEditingController titleController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      backgroundColor: Color(0xFFEDE7F6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text("  Perform your action below ", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 28),),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                label: Text("Title"),
                hintText: "Add a title",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: commentController,
              decoration: InputDecoration(
                label: Text("Comments"),
                hintText: "Add comments",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          SizedBox(height: 60,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(onPressed: (){
                   Provider.of<dbprovider>(context).addTask(task : TaskModel(title: titleController.text, comment: commentController.text));
                   Navigator.pop(context);
                },
                    child: Text("Add successfully", style: TextStyle(fontSize: 22),)),
                OutlinedButton(onPressed: (){},
                    child: Text("Delete",style: TextStyle(fontSize: 22)))
              ],
            ),
          ),
        ],
      ),
    );

  }
}