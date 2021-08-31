import 'package:auti_pharm/core/constants.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/child_image.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:auti_pharm/utils/widgets/custom_drop_down.dart';
import 'package:auti_pharm/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'about_us_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key key,
  }) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      pop(context);
                    },
                    child: Icon(Icons.arrow_back_rounded),
                  ),
                  Spacer(),
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  Opacity(child: Icon(Icons.arrow_back_rounded), opacity: 0),
                ],
              ),
              SizedBox(height: 27),
              Text(
                "About Us",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: (){
                  pushTo(context, AboutUsPage());
                },
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      child: Icon(
                        Icons.info_rounded,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        color: overlayColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("About Us")
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
