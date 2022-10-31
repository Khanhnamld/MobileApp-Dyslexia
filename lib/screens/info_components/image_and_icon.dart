import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task_planner_app/screens/info_components/color.dart';
import 'icon.dart';
import 'package:flutter_task_planner_app/screens/info_components/title_and_price.dart';

class ImageAndIcons extends StatefulWidget {
  final Size size;
  const ImageAndIcons({
    Key? key,
    required this.size
  }) : super(key: key);





  @override
  State<StatefulWidget> createState() => _ImageAndIcons();

}
class _ImageAndIcons extends State<ImageAndIcons>{
  // final Size size;
  int selectedIndex = 0;
  List<String> listIcon = ['menu', 'icon_2', 'icon_3', 'icon_4'];
  PageController _pageController = PageController();
  // _ImageAndIcons(this.size);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: widget.size.height * 0.8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
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
                    Expanded(
                      child: Container(
                        child: PageView(
                          controller: _pageController,
                          children: <Widget>[
                            // TitleAndPrice(title: "Tong Quat", country: "Cay rau muong", price: 1),
                            // TitleAndPrice(title: "Dieu kien tu nhien", country: "Cay rau muong", price: 1),
                            // TitleAndPrice(title: "Cach trong", country: "Cay rau muong", price: 1),
                            // TitleAndPrice(title: "", country: "Cay rau muong", price: 1)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Container(
            //   height: widget.size.height * 0.8,
            //   width: widget.size.width * 0.75,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(63),
            //       bottomLeft: Radius.circular(63),
            //     ),
            //     boxShadow: [
            //       BoxShadow(
            //         offset: Offset(0, 10),
            //         blurRadius: 60,
            //         color: kPrimaryColor.withOpacity(0.29),
            //       ),
            //     ],
            //     image: DecorationImage(
            //       alignment: Alignment.centerLeft,
            //       fit: BoxFit.cover,
            //       image: AssetImage("assets/images/img.png"),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}