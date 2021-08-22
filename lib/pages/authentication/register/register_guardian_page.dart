import 'package:auti_pharm/core/models/authentication_details.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:auti_pharm/utils/widgets/custom_drop_down.dart';
import 'package:auti_pharm/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'set_password_page.dart';

class RegisterGuardianPage extends StatefulWidget {
  final ChildDetails initialChildDetails;
  const RegisterGuardianPage({Key key, this.initialChildDetails})
      : super(key: key);

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
                "Let’s get you all\nsetup - Caretaker's\nDetails",
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
                      onChanged: (v) {
                        setState(() {
                          firstName = v;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      header: "Guardian's Lastname ",
                      hint: "e.g. Adekanbi",
                      onChanged: (v) {
                        setState(() {
                          lastName = v;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      header: "Guardian's Email ",
                      hint: "e.g. Adekanbi",
                      onChanged: (v) {
                        setState(() {
                          email = v;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    CustomDropDown(
                      header: "Relationship with child",
                      intialValue: null,
                      onSelected: (v) {
                        relationship = v;
                      },
                      items: relationshipOptions
                          .map((e) => CustomDropDownItem(value: e, text: e))
                          .toList(),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: "Next",
                      validator: validator,
                      onPressed: () {
                        RegisterDetails registerDetails = RegisterDetails(
                          name: "$firstName $lastName",
                          email: email,
                          relationshipWithChild: relationship,
                          initialChildDetails: widget.initialChildDetails,
                        );
                        pushTo(
                          context,
                          SetPasswordPage(
                            registerDetails: registerDetails,
                          ),
                        );
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

  String firstName = "";
  String lastName = "";
  String email = "";
  String relationship = "";

  bool validator() =>
      firstName.isNotEmpty &&
      lastName.isNotEmpty &&
      email.isNotEmpty &&
      relationship.isNotEmpty;

  List<String> relationshipOptions = [
    "Mother",
    "Father",
    "Guardian",
    "Nurse",
    "Uncle",
    "Aunt",
    "Sister",
    "Brother",
    "Grandmother",
    "Grandfather",
    "Cousin",
    "Doctor"
  ];
}
