import 'package:flutter/material.dart';
import 'package:flutter_task_planner_app/theme/colors/light_colors.dart';
import 'package:flutter_task_planner_app/screens/network.dart';
import 'package:flutter_task_planner_app/screens/search_plant.dart';
import 'package:flutter_task_planner_app/screens/info_components/body.dart';
class Cay_info extends StatelessWidget {
  final Plant plant;
  const Cay_info({Key? key, required this.plant}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text(plant.title),
        // ),
    // );
        body: Body(plant: plant),
    );
  }
}
