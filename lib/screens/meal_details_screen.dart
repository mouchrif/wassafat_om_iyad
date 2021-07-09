import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wassafat_om_iyad/constants.dart';
import 'package:wassafat_om_iyad/providers/meals_list.dart';
import 'package:wassafat_om_iyad/widgets/buildTab.dart';
import 'package:wassafat_om_iyad/widgets/buildTabViewContainer.dart';
import 'package:wassafat_om_iyad/widgets/my_custom_clipper.dart';

class MealDetailsScreen extends StatelessWidget {
  static String routeName = "/meal-details";
  final Function isFavorite;
  final Function togglerFavorites;
  MealDetailsScreen(
    this.isFavorite,
    this.togglerFavorites,
  );

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final _mealId = ModalRoute.of(context).settings.arguments;
    final _selectedMeal = meals.firstWhere((meal) => meal.id == _mealId);

    return Scaffold(
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 6,
          primary: kTextWhite70Color.withOpacity(0.6),
          onPrimary: kSecondaryColor,
          shape: CircleBorder(),
          padding: const EdgeInsets.all(16),
        ),
        onPressed: () {
          togglerFavorites(_mealId);
        },
        child: Icon(
          isFavorite(_mealId)
              ? FontAwesomeIcons.solidHeart
              : FontAwesomeIcons.heart,
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.4),
        child: ClipPath(
          clipper: MyCustomClipper(),
          child: Container(
            color: kPrimaryColor,
            child: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: size.width * 0.5,
                      height: size.height * 0.4 - 40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            _selectedMeal.imageAdrr,
                          ),
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 20),
                      width: size.width * 0.5,
                      height: size.height * 0.4 - 40,
                      // color: Colors.red,
                      child: Column(
                        // textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              FontAwesomeIcons.arrowAltCircleRight,
                              color: kTextWhite70Color,
                            ),
                          ),
                          Text(
                            _selectedMeal.title,
                            textAlign: TextAlign.end,
                            maxLines: 2,
                            style: TextStyle(
                              height: 1,
                              color: kTextWhite70Color,
                              fontSize: 20,
                            ),
                          ),
                          rowContainer(
                              context,
                              Icon(
                                FontAwesomeIcons.clock,
                                color: kTextWhite70Color,
                                size: 20,
                              ),
                              size.width * 0.03,
                              "${_selectedMeal.duration} دقائق"),
                          rowContainer(
                              context,
                              Icon(
                                FontAwesomeIcons.heart,
                                color: kSecondaryColor,
                                size: 20,
                              ),
                              size.width * 0.03,
                              "${_selectedMeal.duration} محب"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height * 0.6,
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                unselectedLabelColor: kPrimaryColor,
                labelColor: kTextWhite70Color,
                unselectedLabelStyle: TextStyle(fontSize: 16),
                labelStyle: TextStyle(fontSize: 18),
                indicator: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(29)),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  BuildTab(text: "المكونات", color: kPrimaryColor, width: 1),
                  BuildTab(
                      text: "طريقة التحضير", color: kPrimaryColor, width: 1),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    BuildTabViewContainer(
                      list: _selectedMeal.ingredients,
                      cardColor: kCardColor,
                      listName: "Ingredients",
                    ),
                    BuildTabViewContainer(
                      list: _selectedMeal.steps,
                      cardColor: kCardColor,
                      listName: "Steps",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
