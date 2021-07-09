import 'package:flutter/material.dart';
import 'package:wassafat_om_iyad/providers/meal.dart';
import 'package:wassafat_om_iyad/widgets/mealItem_gridContainer.dart';

class FavoritesScreen extends StatelessWidget {
  static String routeName = "/favorites";
  final List<Meal> favoritedList;
  FavoritesScreen(this.favoritedList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: Text(
            "المفضلة",
            textAlign: TextAlign.end,
          ),
        ),
      ),
      body: favoritedList.isEmpty 
      ? Center(
        child: Text(
          "قائمة المفضلة فارغة",
        ),
      )
      : MealItemGridContainer(favoritedList),
    );
  }
}
