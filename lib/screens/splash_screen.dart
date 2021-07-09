import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wassafat_om_iyad/screens/tabs_screen.dart';

import '../constants.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/splash-bg.png"), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                // gradient: kGradient,
                color: Colors.black12.withOpacity(0.6),
              ),
            ),
          ),
          Positioned(
            top: 0,
            // left: size.width*0.5,
            child: Container(
              alignment: Alignment.center,
              width: size.width,
              height: size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    height: size.height * 0.16,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kPrimaryColor,
                        width: 1.0,
                      ),
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/wassafat_om_iyad-min.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    "وصفات أم إياد",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 1.0,
                      color: kPrimaryColor.withOpacity(0.7),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: (size.width*0.5 - (size.width*0.4)/2),
            child: Container(
              width: size.width*0.4,
              child: OutlinedButton(
                onPressed: (){
                  Navigator.of(context)
                      .pushReplacementNamed(TabsScreen.routeName);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "الدخول",
                      style: TextStyle(
                        // color: kTextWhite70Color,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              
                    Container(
                      margin: const EdgeInsets.only(
                        left: 12
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/enter.svg",
                        color: kTextWhite70Color,
                        height: size.height*0.035,
                      ),
                    ),
                  ],
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 6,
                    horizontal: 20
                  ),
                  elevation: 20,
                  shadowColor: kPrimaryColor.withOpacity(0.2),
                  primary: kTextWhite70Color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                  side: BorderSide(
                    width: 2,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
