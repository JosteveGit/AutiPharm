import 'dart:async';

import 'package:auti_pharm/pages/authentication/login_page.dart';
import 'package:auti_pharm/utils/functions/dev_utils.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 3),
      () {
        pushReplacementToWithRoute(context, CustomRoutes.fadeIn(LoginPage()));
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.white);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 44,
              padding: EdgeInsets.only(top: 2, right: 2, left: 30),
              child: Text(
                "Auti",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
              decoration: BoxDecoration(
                color: pillOverlayColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                ),
              ),
            ),
            Container(
              height: 44,
              padding: EdgeInsets.only(
                top: 2,
                bottom: 2,
                right: 30,
              ),
              child: Text(
                "Pharm",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
