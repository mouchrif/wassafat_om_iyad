import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xffEFBF26);
const Color kSecondaryColor = Color(0xffB43934);
const Color kBGColor = Color(0xff000000);
const Color kCardColor = Color(0xff1d1a16);
const Color kTextColor = Color(0xff757575);
const Color kTextWhite70Color = Colors.white70;
const Color kTextWhiteColor = Colors.white;

const LinearGradient kGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    kPrimaryColor,
    kSecondaryColor,
  ],
);
const LinearGradient kCategoryLightGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    Color(0xffFFB75E),
    Color(0xffED8F03),
  ],
);

Widget rowContainer(BuildContext ctx, Icon icon, double wSp, String text) {
  return Row(
    textDirection: TextDirection.rtl,
    children: [
      icon,
      SizedBox(
        width: wSp
      ),
      Text(
        text,
        textDirection: TextDirection.rtl,
        style: Theme.of(ctx).textTheme.bodyText2,
      ),
    ],
  );
}
