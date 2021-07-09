import 'package:flutter/material.dart';
import 'package:wassafat_om_iyad/constants.dart';
import 'package:wassafat_om_iyad/providers/categories_list.dart';
import 'package:wassafat_om_iyad/widgets/category-item.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = "/categories";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    Widget buildPositionedContainer(
      double top,
      double left,
      double right,
      double width, 
      double height, 
      Color color, 
      Radius topLeft,
      Radius bottomLeft,
      Radius bottomRight) {
      return Positioned(
        top: top,
        left: left,
        right: right,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              topLeft: topLeft,
              bottomLeft: bottomLeft,
              bottomRight: bottomRight,
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          buildPositionedContainer(
            0, 
            0, 
            null, 
            size.width, 
            size.height * 0.35, 
            kPrimaryColor, 
            Radius.circular(0),
            Radius.circular(22), 
            Radius.circular(22)
          ),
          buildPositionedContainer(
            0, 
            null, 
            25, 
            size.width * 0.6,
            size.height * 0.3, 
            kSecondaryColor.withOpacity(0.18),
            Radius.circular(90),
            Radius.circular(100), 
            Radius.circular(60)
          ),
          Positioned(
            top: 34,
            right: 20,
            child: Container(
              alignment: Alignment.center,
              width: size.width * 0.6,
              child: Text(
                "مرحباً بكم عند وصفات أم إياد",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kTextWhite70Color,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.2,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height,
              child: GridView.count(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0, vertical: 20.0),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  ...categories
                      .map(
                        (category) => CategoryItem(
                            id: category.id,
                            title: category.title,
                            imageAdrr: category.imageAdrr,
                            color: category.color),
                      )
                      .toList(),
                ]),
            ),
          ),
        ],
      ),
    );
  }
}
