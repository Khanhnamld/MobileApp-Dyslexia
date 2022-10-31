import 'dart:async';

import 'package:flutter_task_planner_app/screens/info_components/color.dart';
import 'package:flutter_task_planner_app/screens/network.dart';
import 'package:flutter_task_planner_app/screens/search_plant.dart';
import 'package:flutter_task_planner_app/screens/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/screens/Cay_info.dart';

class FilterNetworkListPage extends StatefulWidget {
  @override
  FilterNetworkListPageState createState() => FilterNetworkListPageState();
}

class FilterNetworkListPageState extends State<FilterNetworkListPage> {
  List<Plant> books = [];
  String query = '';
  Timer? debouncer;

  @override
  void initState() {
    super.initState();

    init();
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }

  void debounce(
      VoidCallback callback, {
        Duration duration = const Duration(milliseconds: 1000),
      }) {
    if (debouncer != null) {
      debouncer!.cancel();
    }

    debouncer = Timer(duration, callback);
  }

  Future init() async {
    final books = await BooksApi.getPlants(query);

    setState(() => this.books = books);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: PreferredSize(
      preferredSize: Size.fromHeight(50.0),
      child: AppBar(
        elevation: 0,
        title: Text("Tìm kiếm", style: TextStyle(fontSize: 30, fontFamily: 'Poppins-Bold',)),
        backgroundColor: Color(0xFF0C9869),
      )
    ),
    body: SafeArea(
      child: Column(
        children: <Widget>[
          Container(
          // margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
          // It will cover 20% of our total height
          height: 70,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  left: kDefaultPadding,
                  right: kDefaultPadding,
                  bottom: 36 + kDefaultPadding,
                ),
                height: 400 * 0.2 - 27,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(36),
                    bottomRight: Radius.circular(36),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    height: 54,
                    child: buildSearch()
                ),
              ),
            ],
          ),
        ),

          Expanded(
            child: ListView.builder(
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];

                return buildBook(book);
              },
            ),
          ),
        ],
      ),
    ),
  );

  Widget buildSearch() => SearchWidget(
    text: query,
    hintText: 'Tim loai cay',
    onChanged: searchBook,
  );

  Future searchBook(String query) async => debounce(() async {
    final books = await BooksApi.getPlants(query);

    if (!mounted) return;

    setState(() {
      this.query = query;
      this.books = books;
    });
  });

  Widget buildBook(Plant plant) => Column(
    children: <Widget>[
        SizedBox(height: kDefaultPadding),
        Container(
        // leading: Image.network(
        //   plant.img_url,
        //   fit: BoxFit.cover,
        //   width: 50,
        //   height: 50,
        // ),
        // title: Text(plant.title),
        // // subtitle: Text(plant.author),
        // onTap: () {
        //   Navigator.push(context,
        //       new MaterialPageRoute(
        //           builder: (context) => Cay_info(plant: plant))
        //   );
        // }
        height: 150,
        // alignment: Alignment.center,
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          // At end item it add extra 20 right  padding
          right: kDefaultPadding,
        ),
        // padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        decoration: BoxDecoration(
          color: Color(0xffcbf2d3),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black26),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(
                    builder: (context) => Cay_info(plant: plant))
            );
          },
          child: Row(
            children: <Widget>[
              Container(
                height: 150,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(plant.img_url),
                  ),
                ),
              ),
              Text("${plant.title}",
                style: TextStyle(
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
      ),
      SizedBox(height: kDefaultPadding)
    ],
  );

}