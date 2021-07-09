import 'package:flutter/material.dart';

import '../constants.dart';

class OnBoardingContent extends StatelessWidget {
  final String title;
  final String text;
  final String image;
  OnBoardingContent(
      {@required this.title, @required this.text, @required this.image});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            height: size.height*0.42,
          ),
        ),
        Container(
          child: Column(
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryColor,
                  letterSpacing: 1.0,
                  fontSize: 32,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
