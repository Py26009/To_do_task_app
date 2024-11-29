 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/dbHelper.dart';
 import 'package:untitled/addTaskPage.dart';
import 'package:untitled/proivder.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List mData = [];
  @override
  Widget build(BuildContext context) {

    mData = Provider.of<dbprovider>(context).getAllTasks();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "         Hello  'A'", style: TextStyle(color: Colors.black),),
        leading: Padding(
            padding: EdgeInsets.all(16.0),
            child: Icon(Icons.account_circle, size: 30, color: Colors.black,)),
        backgroundColor: Color(0xFFE6EE9C),
        foregroundColor: Colors.white,
        leadingWidth: 2,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(11),
            )
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.logout, color: Colors.black,),
          ),
        ],
      ),
      body: getTaskListView(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        navigateToAddTasks('Add Tasks');
      },
        tooltip: "Add Task",
        backgroundColor: Color(0xFFE6EE9C),
        child: Icon(Icons.add),),
    );
  }

  /// Ab yaha hum apne function getTaskListView ko define karengye
  ListView getTaskListView() {
    return ListView.builder(
      itemCount: mData.length,
      itemBuilder: (_, context) {
        return Container(
          height: 100,
          width: 270,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: Colors.grey.withOpacity(0.4),
            border: Border.all(),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFFFF59D),
              child: Icon(Icons.arrow_right_outlined),
            ),
            title: Text(mData[index].title),
            subtitle: Text(mData[index].comment),
            trailing: SizedBox(
              width: 150,
              child: Row(
                children: [
                  IconButton(onPressed: () {
                    navigateToAddTasks('Edit Tasks');
                  },
                      icon: Icon(Icons.edit)),
                  IconButton(onPressed: () {},
                      icon: Icon(Icons.delete)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

 /// Making a common function of navigation
  void navigateToAddTasks(String title) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => addTask(title)));
  }
}


