import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wassafat_om_iyad/constants.dart';
import 'package:wassafat_om_iyad/providers/meal.dart';
import 'package:wassafat_om_iyad/screens/category_screen.dart';
import 'package:wassafat_om_iyad/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  static String routeName = "/tabs";
  final List<Meal> favoritedList;
  TabsScreen(this.favoritedList);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Object> pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    pages = [
      CategoryScreen(),
      FavoritesScreen(widget.favoritedList),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.list,
            ),
            label: "التصنيفات",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              FontAwesomeIcons.solidHeart,
            ),
            label: "المفضلة",
          ),
        ],
        elevation: 6,
        currentIndex: _selectedIndex,
        iconSize: 22.0,
        unselectedItemColor: kTextWhiteColor,
        selectedLabelStyle:
            TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        backgroundColor: Color(0xff000000),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: pages[_selectedIndex],
    );
  }
}
