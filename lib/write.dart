import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/data/todo.dart';

class TodoWritePage extends StatefulWidget{

  final Todo todo;

  TodoWritePage({Key key, this.todo}): super(key : key);

  @override
  State<StatefulWidget> createState() {
    return _TodoWritePageState();
  }
}

class _TodoWritePageState extends State<TodoWritePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         actions: [
           TextButton(
             child: Text("저장", style: TextStyle(color: Colors.white),),
             onPressed: (){
               // 페이지 저장 시 사용
             },
           )
         ],
       )
    );
  }
}