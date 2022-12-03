import 'package:flutter/material.dart';
import 'package:todo/write.dart';

import 'data/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Todo> todos = [
    Todo(
      title: "패스트캠퍼스 강의 듣기",
      memo : "앱개발",
      color : Colors.redAccent.value,
      done: 0,
      category: "공부",
      date: 20210709,
    ),
    Todo(
      title: "패스트캠퍼스 강의 듣기2",
      memo : "앱개발",
      color : Colors.blue.value,
      done: 1,
      category: "공부",
      date: 20210709,
    ),
  ];

  @override
  void initState() {
    super.initState();
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child:AppBar(),
        preferredSize: Size.fromHeight(0),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white,),
        onPressed: (){
          // 화면 이동을 해야합니다.
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => TodoWritePage(todo: Todo(
                title: "",
                color: 0,
                memo: "",
                done: 0,
                category: "",
              ))));
        },
      ),
      body: ListView.builder(
        itemBuilder: (ctx, idx){
          if(idx == 0){
            return Container(
              child: Text("오늘 하루", style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold),),
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          );
          }else if(idx == 1) {

            List<Todo> undone = todos.where((t){
              return t.done == 0;
            }).toList();

            return Container(
              child: Column(
                children: List.generate(undone.length, (_idx) {
                  Todo t = undone[_idx];
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Color(t.color)
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(t.title, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                            Text(t.done == 0 ? "미완료" : "완료", style: TextStyle(color: Colors.white),),
                          ],
                        ),
                        Container(height: 8),
                        Text(t.memo, style: TextStyle(color: Colors.white))
                      ],
                    )
                  );
                }),
              ),
            );
          }
          else if(idx == 2){
            return Container(
              child: Text("완료된 하루", style: TextStyle(fontSize: 20, fontWeight:FontWeight.bold),),
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            );
          }else if(idx == 3) {
            List<Todo> done = todos.where((t){
              return t.done == 1;
            }).toList();

            return Container(
              child: Column(
                children: List.generate(done.length, (_idx) {
                  Todo t = done[_idx];
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(t.color)
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(t.title, style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),),
                              Text(t.done == 0 ? "미완료" : "완료", style: TextStyle(color: Colors.white),),
                            ],
                          ),
                          Container(height: 8),
                          Text(t.memo, style: TextStyle(color: Colors.white))
                        ],
                      )
                  );
                }),
              ),
            );
          }

          return Container();
        },
        itemCount: 4,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.today_outlined),
            label: "오늘"
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.more_horiz),
          label: "기록"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: "더보기"
          ),
        ],
      ),
    );
  }
}
