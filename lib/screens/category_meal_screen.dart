import 'package:flutter/material.dart';
import 'package:wassafat_om_iyad/providers/meal.dart';
import 'package:wassafat_om_iyad/providers/meals_list.dart';
import 'package:wassafat_om_iyad/widgets/mealItem_gridContainer.dart';

class CategoryMealScreen extends StatefulWidget {
  static String routeName = "/category-meal";

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  List<Meal> filtredMeals;
  String categoryTitle;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    categoryTitle = routeArgs['title'];
    filtredMeals =
        meals.where((meal) => meal.category == routeArgs['id']).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: Text(
            categoryTitle,
            textAlign: TextAlign.end,
          ),
        ),
      ),
      body: MealItemGridContainer(filtredMeals),
    );
  }
}
