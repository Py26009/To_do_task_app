import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:untitled/addTaskPage.dart';
import 'package:untitled/proivder.dart';

import 'HomePage.dart';

void main(){
  runApp(ChangeNotifierProvider(create: (context)=>dbprovider(),
  child: MyApp(),
  )
  );
}
 class MyApp extends StatelessWidget{

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
 }