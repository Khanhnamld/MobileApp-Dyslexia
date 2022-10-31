import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/screens/info_components/color.dart';

import 'package:flutter_task_planner_app/screens/info_components/image_and_icon.dart';
import 'package:flutter_task_planner_app/screens/info_components/title_and_price.dart';
import 'icon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_planner_app/screens/network.dart';
import 'package:flutter_task_planner_app/screens/search_plant.dart';

class Body extends StatefulWidget{
  final Plant plant;
  const Body({Key? key, required this.plant}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _Body();
}

class _Body extends State<Body> {
  int selectedIndex = 0;
  int currentIndex = 0;
  List<String> listIcon = ['menu', 'icon_2', 'save-plant', 'caution'];
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
            Padding(
            padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
            child: SizedBox(
              height: size.height * 0.8,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                              icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Spacer(),
                          ListView.separated(
                              shrinkWrap: true,
                              itemCount: 4,
                              separatorBuilder: (BuildContext context, int index) {
                                return SizedBox(height:  1);
                              },
                              itemBuilder: (BuildContext context, int index){
                                return GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      selectedIndex = index;
                                      _pageController.jumpToPage(index);
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        height: (selectedIndex == index) ? 60 : 0,
                                        width: 5,
                                        color: Colors.blue,
                                      ),
                                      Expanded(
                                          child: Row(
                                            children: <Widget>[
                                              IconCard(icon: "assets/icons/${listIcon[index]}.svg")
                                            ],
                                          ))
                                    ],
                                  ),
                                );
                              }
                          ),
                          SizedBox(height: kDefaultPadding),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: size.height * 0.8,
                    width: size.width * 0.75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(63),
                        bottomLeft: Radius.circular(63),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 60,
                          color: kPrimaryColor.withOpacity(0.29),
                        ),
                      ],
                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.plant.img_url),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
           // TitleAndPrice(title: "Tong Quat", country: "Russia", price: 440),
          Container(
            height: 1500,
            child: PageView(
              controller: _pageController,
              children: <Widget>[
                TitleAndPrice(title: "Tổng Quát", country: "${widget.plant.title}", body: "${widget.plant.body}"),
                TitleAndPrice(title: "Điều kiện tự nhiên", country: "${widget.plant.title}", body: "${widget.plant.dieukien}"),
                TitleAndPrice(title: "Cách trồng", country: "${widget.plant.title}", body: "${widget.plant.cachtrong}"),
                TitleAndPrice(title: "Lưu ý", country: "${widget.plant.title}", body: "${widget.plant.luuy}")
                // Text("sadfád")
              ],
            ),
          ),
          // Container()
          // PageView.builder(
          //   controller: _pageController,
          //   onPageChanged: (page){
          //     setState(() {
          //       currentIndex = page;
          //     });
          //   },
          // ),

          SizedBox(height: kDefaultPadding),

        ],
      ),
    );
  }
}