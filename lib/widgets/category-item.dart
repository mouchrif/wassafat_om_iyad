import 'package:flutter/material.dart';
import 'package:wassafat_om_iyad/screens/category_meal_screen.dart';

import '../constants.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageAdrr;
  final Color color;
  CategoryItem({
    @required this.id,
    @required this.title,
    @required this.imageAdrr,
    @required this.color,
  });
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    void _selectedCategory(BuildContext ctx) {
      Navigator.of(ctx).pushNamed(
        CategoryMealScreen.routeName,
        arguments: {
          'id': id,
          'title': title,
        },
      );
    }
    return GestureDetector(
      onTap: () => _selectedCategory(context),
      child: Card(
        color: color,
        child: Container(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage(imageAdrr),
                fit: BoxFit.cover,
                height: size.height * 0.08,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextWhite70Color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
