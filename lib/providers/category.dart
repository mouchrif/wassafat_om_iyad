import 'package:flutter/material.dart';
import 'package:wassafat_om_iyad/constants.dart';

class Category {
  final String id;
  final String imageAdrr;
  final String title;
  final Color color;
  const Category({
    @required this.id,
    @required this.imageAdrr,
    @required this.title,
    this.color = kCardColor,
  });
}
