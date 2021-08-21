import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:auti_pharm/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'set_password_page.dart';

class RegisterGuardianPage extends StatefulWidget {
  const RegisterGuardianPage({Key key}) : super(key: key);

  @override
  _RegisterGuardianPageState createState() => _RegisterGuardianPageState();
}

class _RegisterGuardianPageState extends State<RegisterGuardianPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let’s get you all\nsetup - Guardian's\nDetails",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Kindly provide us with information about the guardian",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: ListView(
                  children: [
                    CustomTextField(
                      header: "Guardian's Firstname ",
                      hint: "e.g. Josteve",
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      header: "Guardian's Lastname ",
                      hint: "e.g. Adekanbi",
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      header: "Guardian's Email ",
                      hint: "e.g. Adekanbi",
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: "Next",
                      onPressed: () {
                        pushTo(context, SetPasswordPage());
                      },
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
