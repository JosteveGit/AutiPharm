import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:auti_pharm/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'register_guardian_page.dart';

class RegisterChildPage extends StatefulWidget {
  const RegisterChildPage({Key key}) : super(key: key);

  @override
  _RegisterChildPageState createState() => _RegisterChildPageState();
}

class _RegisterChildPageState extends State<RegisterChildPage> {
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
                "Let’s get you all\nsetup - Child’s\nDetails",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Kindly provide us with information about the child",
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
                      header: "Child's Firstname ",
                      hint: "e.g. Josteve",
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      header: "Child's Lastname ",
                      hint: "e.g. Adekanbi",
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Child’s Date of Birth",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    Row(children: [
                      Expanded(
                        child: CustomTextField(
                          headerLess: true,
                          hint: "Day",
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomTextField(
                          headerLess: true,
                          hint: "Month",
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomTextField(
                          headerLess: true,
                          hint: "Year",
                        ),
                      ),
                    ]),
                    SizedBox(height: 20),
                    CustomButton(
                      text: "Next",
                      onPressed: () {
                        pushTo(context, RegisterGuardianPage());
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
