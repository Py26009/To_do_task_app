import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/TasksModel.dart';

class dbHelper {
  /// Step 1: Making a private constructor
   dbHelper._();

   /// Step 2: Making a singleton class of our private constructor
  static dbHelper getInstance() => dbHelper._();

  /// Step 3: Creating a database and since action will be taken earlier and database will be created after
   ///  so we will create our database of future type.

   Database? mDb;

   static final String TABLE_TASK = "tasks";
   static final String TASK_COLUMN_ID = "n_id";
   static final String TASK_COLUMN_TITLE = "n_title";
   static final String TASK_COLUMN_COMMENT = "n_comment";


   Future<Database> initDB() async {
     mDb = mDb ?? await openDB();
     print(" DB opened");
     return mDb!;
   }
  /// Though we have asked to open the Database, we haven't defined how to open it.For that we will create
  ///  a function of openDB.

   Future<Database> openDB() async {
     var dirPath = await getApplicationDocumentsDirectory();
     var dbPath = join(dirPath.path, "tasks.db");
     return openDatabase(dbPath, version: 1, onCreate: (db, version) {
       print("DB created");


       /// Create Table
       db.execute(
           "CREATE TABLE $TABLE_TASK($TASK_COLUMN_ID integer primary key autoincrement, $TASK_COLUMN_TITLE text, $TASK_COLUMN_COMMENT text, )");
     });
   }

   /// INSERT QUERY

   Future<bool> addTask( TaskModel newTask) async {
     var db=await openDB();

     int rowEffected = await db.insert(TABLE_TASK, newTask.toMap());
     return rowEffected > 0;
   }

  /// SELECT QUERY

     Future<List<TaskModel>> fetchAllTasks() async{

     Database db = await initDB();
     List<TaskModel> mTasks = [];

     List<Map<String, dynamic>> allTasks = await db.query(TABLE_TASK);
     for (Map<String, dynamic> eachData in allTasks){
       TaskModel eachTask = TaskModel.fromMap(eachData);
       mTasks.add(eachTask);
     }
     return mTasks;
   }

 /// DELETE QUERY:


     }