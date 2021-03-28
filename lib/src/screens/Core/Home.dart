import 'package:diabetes_assistant/constants.dart';
import 'package:diabetes_assistant/src/widgets/bottom_nav_bar.dart';
import 'package:diabetes_assistant/src/widgets/category_card.dart';
import 'package:diabetes_assistant/src/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; // This is going to gie me the total height and width of my device
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of my total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kAppMainColor,
              /*image: DecorationImage(
                alignment: Alignment.centerLeft,
                fit: BoxFit.fitHeight,
                image: AssetImage("assets/images/water_home.png"),
              ),*/
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFF0EA394),
                        shape: BoxShape.circle,
                      ),
                      // child: SvgPicture.asset("assets/icons/menu.svg"),
                      child: Image.asset("assets/icons/menu1_white.png"),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    alignment: Alignment.center,
                    height: 70,
                    width: 70,
                    child: Image.asset("assets/icons/logo_white.png"),
                  ),
                  Text(
                    "Your Mobile Medical Care",
                    style: Theme.of(context).textTheme.display1.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 22,
                        color: Colors.white),
                  ),
                  SearchBar(
                    searchText: "What are you looking for?",
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .92,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Self Recordings",
                          imgSrc: "assets/icons/self_recordings.png",
                          press: () {
                            Navigator.of(context).pushNamed('/recordings');
                          },
                        ),
                        CategoryCard(
                            title: "Life Style Data",
                            imgSrc: "assets/icons/lifestyles.png",
                            press: () {
                              Navigator.of(context).pushNamed('/lifestyle');
                            }),
                        CategoryCard(
                          title: "Education",
                          imgSrc: "assets/icons/education.png",
                          press: () {
                            Navigator.of(context).pushNamed('/education');
                          },
                        ),
                        CategoryCard(
                          title: "Medication",
                          imgSrc: "assets/icons/medication.png",
                          press: () {
                            Navigator.of(context).pushNamed('/medication');
                          },
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
    );
  }
}