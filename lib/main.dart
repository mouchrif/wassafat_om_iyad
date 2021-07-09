import 'package:flutter/material.dart';
import 'package:wassafat_om_iyad/constants.dart';
import 'package:wassafat_om_iyad/providers/meal.dart';
import 'package:wassafat_om_iyad/providers/meals_list.dart';
import 'package:wassafat_om_iyad/screens/category_meal_screen.dart';
import 'package:wassafat_om_iyad/screens/category_screen.dart';
import 'package:wassafat_om_iyad/screens/meal_details_screen.dart';
import 'package:wassafat_om_iyad/screens/on_boarding_screen.dart';
import 'package:wassafat_om_iyad/screens/splash_screen.dart';
import 'package:wassafat_om_iyad/screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _listOfFavorites = [];

  void toggleFavorites(String mealId) {
    final _existingIndex =
        _listOfFavorites.indexWhere((meal) => meal.id == mealId);
    if (_existingIndex < 0) {
      setState(() {
        _listOfFavorites.add(meals.firstWhere((meal) => meal.id == mealId));
      });
    } else {
      setState(() {
        _listOfFavorites.removeAt(_existingIndex);
      });
    }
  }

  bool isFavorite(String mealId) {
    return _listOfFavorites.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wassafat om iyad application',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: kPrimaryColor,
          backwardsCompatibility: false,
        ),
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBGColor,
        fontFamily: '18 Khebrat Musamim',
        textTheme: TextTheme(
          bodyText1: TextStyle(
            color: kTextColor,
          ),
          bodyText2: TextStyle(
            color: kTextWhite70Color,
          ),
        ),
      ),
      initialRoute: SplashScreen.routeName,
      // home: SplashScreen(),
      routes: {
        SplashScreen.routeName: (ctx) => SplashScreen(),
        OnBoardingScreen.routeName: (ctx) => OnBoardingScreen(),
        CategoryScreen.routeName: (ctx) => CategoryScreen(),
        TabsScreen.routeName: (ctx) => TabsScreen(_listOfFavorites),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetailsScreen.routeName: (ctx) =>
            MealDetailsScreen(isFavorite, toggleFavorites),
      },
    );
  }
}
