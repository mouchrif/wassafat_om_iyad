import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wassafat_om_iyad/constants.dart';
import 'package:wassafat_om_iyad/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageAdrr;
  final int duration;
  final List<String> ingredients;
  final List<String> steps;
  MealItem(
    {@required this.id,
    @required this.title,
    @required this.imageAdrr,
    @required this.duration,
    @required this.ingredients,
    @required this.steps
  });

  void _selectedMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailsScreen.routeName, 
      arguments: id
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectedMeal(context),
      child: LayoutBuilder(
        builder: (BuildContext ctx, BoxConstraints constraints) => Container(
          color: Colors.transparent,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 14.0),
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.78,
                  decoration: BoxDecoration(
                    color: kCardColor,
                    borderRadius: BorderRadius.circular(29),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 14.0),
                  width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.78 -
                      (constraints.maxHeight * 0.23),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 40,
                        child: Text(
                          title,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(height: 1, fontSize: 19),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "${duration.toString()}\nدقيقة",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: 1,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Icon(
                                    FontAwesomeIcons.solidClock,
                                    color: kPrimaryColor,
                                    size: 22,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            color: kTextWhite70Color,
                            width: 1,
                            height: 20,
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                textDirection: TextDirection.rtl,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.solidHeart,
                                    color: kSecondaryColor,
                                    size: 22,
                                  ),
                                  Text(
                                    "${duration.toString()}\nمحب",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      height: 1,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: kBGColor.withOpacity(0.6),
                          offset: Offset(0, 8),
                          blurRadius: 10,
                          spreadRadius: 1),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      imageAdrr,
                      fit: BoxFit.cover,
                      width: constraints.maxWidth *
                          0.46 *
                          1.5, // 1.5 => ratio between width and height
                      height: constraints.maxHeight * 0.46,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Positioned(
//   bottom: 0,
//   child: ClipPath(
//     clipper: MealClipperBottom(),
//     child: Container(
//       width: constraints.maxWidth,
//       height: constraints.maxHeight*0.7,
//       decoration: BoxDecoration(
//         color: kCardColor,
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Column(
//         children: [
//           Container(
//             alignment: Alignment.center,
//             height: 40,
//             child: Text(
//               title,
//               maxLines: 2,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 height: 1,
//                 fontSize: 19
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// ),
