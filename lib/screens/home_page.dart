import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/screens/tracking_page.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_task_planner_app/widgets/task_column.dart';
import 'package:flutter_task_planner_app/widgets/active_project_card.dart';
import 'package:flutter_task_planner_app/widgets/top_container.dart';
import 'package:flutter_task_planner_app/screens/Searching.dart';
import 'package:flutter_task_planner_app/screens/chatbot.dart';

class HomePage extends StatelessWidget {
  Text subheading(String title) {
    return Text(
      title,
      style: TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 30.0,
          fontWeight: FontWeight.w700,
          fontFamily: 'Poppins-Bold',
          letterSpacing: 1.2),
    );
  }

  static CircleAvatar calendarIcon() {
    return CircleAvatar(
      radius: 25.0,
      backgroundColor: LightColors.kGreen,
      child: Icon(
        Icons.chat_bubble,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopContainer(
              height: 200,
              width: width,
              padding: const EdgeInsets.symmetric(
                  horizontal: 0, vertical: 0.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Icon(Icons.menu,
                        //     color: LightColors.kDarkBlue, size: 30.0),
                        // Icon(Icons.search,
                        //     color: LightColors.kDarkBlue, size: 25.0),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          // CircularPercentIndicator(
                          //   radius: 90.0,
                          //   lineWidth: 5.0,
                          //   animation: true,
                          //   percent: 0.75,
                          //   circularStrokeCap: CircularStrokeCap.round,
                          //   progressColor: LightColors.kRed,
                          //   backgroundColor: LightColors.kDarkYellow,
                          //   center: CircleAvatar(
                          //     backgroundColor: LightColors.kBlue,
                          //     radius: 35.0,
                          //     backgroundImage: AssetImage(
                          //       'assets/images/avatar.png',
                          //     ),
                          //   ),
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  'Welcom Duong Pham !',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 27.0,
                                    color: LightColors.kDarkBlue,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  '',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ]),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Chức Năng'),
                          SizedBox(height: 15.0),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                                  );
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TaskColumn(
                                        icon: Icons.chat,
                                        iconBackgroundColor: LightColors.kRed,
                                        title: 'Chatbot',
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FilterNetworkListPage()),
                                  );
                                },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TaskColumn(
                                        icon: Icons.search,
                                        iconBackgroundColor: LightColors.kDarkYellow,
                                        title: 'Tìm Kiếm',
                                      ),
                                      SizedBox(height: 15.0),
                                    ],

                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TrackingPage()),
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TaskColumn(
                                        icon: Icons.check,
                                        iconBackgroundColor: LightColors.kBlue,
                                        title: 'Kiểm Tra',
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TrackingPage()),
                                    );
                                  },
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      TaskColumn(
                                        icon: Icons.settings,
                                        iconBackgroundColor: LightColors.kGreen,
                                        title: 'Cài đặt',
                                      ),
                                      SizedBox(height: 15.0),
                                    ],

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          subheading('Cây đang trồng'),
                          SizedBox(height: 5.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TrackingPage()),
                              );
                            },
                           child: Row(
                            children: <Widget>[
                              ActiveProjectsCard(
                                    cardColor: LightColors.kGreen,
                                    loadingPercent: 0.25,
                                    title: 'Cây rau muống',
                                    subtitle: 'Trồng được 9 ngày',
                                  ),
                              SizedBox(width: 20.0),
                              ActiveProjectsCard(
                                cardColor: LightColors.kRed,
                                loadingPercent: 0.35,
                                title: 'Cây bắp cải',
                                subtitle: 'Trồng được 15 ngày',
                              ),
                              SizedBox(width: 20.0),
                            ],
                           ),

                              ),
                            ],
                          ),
                       ),
                        ],
                      ),
                    ),
                   ),
                  ],
                ),
              ),
            );
  }
}
