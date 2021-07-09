import 'package:flutter/material.dart';
import 'package:wassafat_om_iyad/constants.dart';
import 'package:wassafat_om_iyad/widgets/on_boarding_content.dart';

class OnBoardingScreen extends StatefulWidget {
  static String routeName = "/on-boarding";

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  List<Map<String, String>> onBoardingData = [
    {
      "title": "إبحث عن الوصفات",
      "text":
          "يمكنك هذا التطبيق من تصفح العديد من الوصفات للأكلات عربية و أخرى أجنبية سهلة و سريعة و لذيذة. كما يزودك بأفكار للعشاء، أفكار للفطور الصباحي و أفكار للغذاء لتحضير أشهى الأطباق",
      "image": "assets/images/Find-recipes.png"
    },
    {
      "title": "سهلة الطهي",
      "text":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image": "assets/images/easy-cook.png"
    },
    {
      "title": "لذيذة المذاق",
      "text":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image": "assets/images/delicious.png"
    },
  ];
  Container buildDot(int index) {
    return Container(
      margin: const EdgeInsets.only(left: 4),
      height: 10,
      width: currentPage == index ? 30 : 10,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xffd8d8d8),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.9,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentPage = value;
                });
              },
              itemCount: onBoardingData.length,
              itemBuilder: (context, index) => OnBoardingContent(
                title: onBoardingData[index]["title"],
                text: onBoardingData[index]["text"],
                image: onBoardingData[index]["image"],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: size.height * 0.1,
            // color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onBoardingData.length,
                (index) => buildDot(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
