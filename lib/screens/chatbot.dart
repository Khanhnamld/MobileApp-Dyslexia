import 'dart:convert';

import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_task_planner_app/screens/Cay_info.dart';
import 'package:flutter_task_planner_app/screens/network.dart';
import 'package:flutter_task_planner_app/screens/search_plant.dart';
class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{
  final GlobalKey<AnimatedListState> _listkey = GlobalKey();
  List<String> _data = [];
  static const String BOT_URL = "http://192.168.0.10:5000/get";
  TextEditingController queryController = TextEditingController();

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            elevation: 0,
            title: Text("ChatBot", style: TextStyle(fontSize: 30)),
            backgroundColor: Color(0xFF0C9869),
          )
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(

              child: Container(
                height: 650,
                child: AnimatedList(
                key: _listkey,
                initialItemCount: _data.length,
                itemBuilder: (BuildContext context, int index, Animation<double> animation){
                  return buildItem(_data[index], animation, index, context);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ColorFiltered(
              colorFilter: ColorFilter.linearToSrgbGamma(),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.message,
                        color: Colors.blue,
                      ),
                      hintText: "Nhập ở đây",
                      fillColor: Colors.white12,
                    ),
                    autocorrect: false,
                    style: TextStyle(fontWeight: FontWeight.w300),
                    controller: queryController,
                    textInputAction: TextInputAction.send,
                    onSubmitted: (msg){
                      this.getResponse();
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void getResponse(){
    if (queryController.text.length > 0){
      this.insertSingleItem(queryController.text);
      var client = getClient();
      try{
        client.post(
          BOT_URL,
          body: {"response": queryController.text},

        )..then((response){
          print(response.body);
          Map<String, dynamic> data = jsonDecode(response.body);
          insertSingleItem(data['response'] + "<bot>");
          // print(data['response']);
        });
      }
      finally{
        client.close();
        queryController.clear();
      }
    }
  }

  void insertSingleItem(String message){
    _data.add(message);
    _listkey.currentState?.insertItem(_data.length - 1);
  }
  http.Client getClient(){
    return http.Client();
  }
}

Widget buildItem(String item, Animation<double> animation, int index, BuildContext context){
  bool mine = item.endsWith("<bot>");
  String t1 = "RAU MUỐNG";
  String t2 = "RAU XÀ LÁCH";
  String t3 = "Cây rau";
  return SizeTransition(
    child: Padding(
      padding: EdgeInsets.only(top: 10, right: 10, left: 10),
      child: Container(
        alignment: mine ? Alignment.topLeft : Alignment.topRight,
        child: Bubble(
          child: Text(
            item.replaceAll(("<bot>"), ""),
            style: TextStyle(
              fontSize: 30,
              color: mine ? Colors.white : Colors.black,
            ),
          ),
          color: mine ? Colors.blue : Colors.grey,
          padding: BubbleEdges.all(10),
        ),
      ),
    ),
    sizeFactor: animation,
  );
  // Future<List<Plant>> _getList(){
  //   return Future.value(BooksApi.getPlants(t3));
  // }
  // // final find = BooksApi.getPlants(t3);
  // // Future<List<Plant>> list_plant = find;
  // // print(list_plant);
  // Future<List<Plant>> find = _getList();
  // List<Plant> list_plant = await find;
  // if (item.contains(t1) == true){
  //   return SizeTransition(
  //     child: Padding(
  //       padding: EdgeInsets.only(top: 10, right: 10, left: 10),
  //       child: Container(
  //         alignment: mine ? Alignment.topLeft : Alignment.topRight,
  //         child: GestureDetector(
  //           onTap: () {
  //             Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => HomeScreen()),
  //             );
  //           },
  //         )
  //       ),
  //     ),
  //     sizeFactor: animation,
  //   );
  // }
  // else if (item.contains(t2) == true){
  //   return SizeTransition(
  //     child: Padding(
  //       padding: EdgeInsets.only(top: 10, right: 10, left: 10),
  //       child: Container(
  //         alignment: mine ? Alignment.topLeft : Alignment.topRight,
  //         child: Bubble(
  //           child: Text(
  //             item.replaceAll(("<bot>"), ""),
  //             style: TextStyle(
  //               fontSize: 30,
  //               color: mine ? Colors.white : Colors.black,
  //             ),
  //           ),
  //           color: mine ? Colors.blue : Colors.grey,
  //           padding: BubbleEdges.all(10),
  //         ),
  //       ),
  //     ),
  //     sizeFactor: animation,
  //   );
  // }
  // else {
  //   return SizeTransition(
  //     child: Padding(
  //       padding: EdgeInsets.only(top: 10, right: 10, left: 10),
  //       child: Container(
  //         alignment: mine ? Alignment.topLeft : Alignment.topRight,
  //         child: Bubble(
  //           child: Text(
  //             item.replaceAll(("<bot>"), ""),
  //             style: TextStyle(
  //               fontSize: 30,
  //               color: mine ? Colors.white : Colors.black,
  //             ),
  //           ),
  //           color: mine ? Colors.blue : Colors.grey,
  //           padding: BubbleEdges.all(10),
  //         ),
  //       ),
  //     ),
  //     sizeFactor: animation,
  //   );
  // };

}