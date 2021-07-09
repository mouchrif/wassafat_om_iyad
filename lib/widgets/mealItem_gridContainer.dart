import 'package:flutter/material.dart';
import 'package:wassafat_om_iyad/providers/meal.dart';

import 'meal-item.dart';

class MealItemGridContainer extends StatelessWidget {
  final List<Meal> list;
  MealItemGridContainer(this.list);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 2 / 3,
        children: [
          ...list.map(
            (meal) => MealItem(
              id: meal.id,
              title: meal.title,
              imageAdrr: meal.imageAdrr,
              duration: meal.duration,
              ingredients: meal.ingredients,
              steps: meal.steps,
            ),
          )
          .toList(),
        ],
      ),
    );
  }
}
