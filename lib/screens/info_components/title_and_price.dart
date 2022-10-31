import 'package:flutter/material.dart';

import 'package:flutter_task_planner_app/screens/info_components/color.dart';

class TitleAndPrice extends StatelessWidget {
  const TitleAndPrice({
    Key? key,
    required this.title,
    required this.country,
    // required this.price,
    required this.body
  }) : super(key: key);

  final String title, country, body;
  // final int price;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
        children: <Widget>[
          Expanded(
           child: RichText(
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            maxLines: 100,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$title\n",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      ?.copyWith(color: kTextColor, fontWeight: FontWeight.bold, fontFamily: 'Poppins-Bold'),
                ),
                TextSpan(
                  text: "$country\n",
                  style: Theme.of(context)
                      .textTheme
                      .headline5  
                      ?.copyWith(color: kPrimaryColor, fontWeight: FontWeight.w300, fontFamily: 'Poppins-Bold'),
                ),
                TextSpan(
                  text: "\n$body",
                  style: TextStyle(
                    fontSize: 27,
                    color: Colors.black,
                    fontFamily: 'Poppins-Bold',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Spacer(),
          // Text(
          //   "\$$price",
          //   style: Theme.of(context)
          //       .textTheme
          //       .headline5
          //       ?.copyWith(color: kPrimaryColor),
          // )
          ),
          // SizedBox(height: kDefaultPadding,),
          // Text(
          //     "sdfffffffffffffffffffffffddddddddddddddddddddddddddddddđ",
          //     style: TextStyle(
          //       fontSize: 27,
          //       color: Colors.black,
          //       fontWeight: FontWeight.w400,
          //     ),
          // ),
        ],
    ),
    );
  }
}