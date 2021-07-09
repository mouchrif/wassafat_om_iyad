import 'package:flutter/material.dart';

class Meal {
  final String id;
  final String category;
  final String title;
  final String imageAdrr;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  const Meal({
    @required this.id,
    @required this.category,
    @required this.title,
    @required this.imageAdrr,
    @required this.duration,
    @required this.ingredients,
    @required this.steps,
  });
}
