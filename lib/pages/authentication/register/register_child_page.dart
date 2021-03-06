import 'package:auti_pharm/core/models/authentication_details.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:auti_pharm/utils/widgets/custom_drop_down.dart';
import 'package:auti_pharm/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                      onChanged: (v) {
                        setState(() {
                          childsFirstName = v;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      header: "Child's Lastname ",
                      hint: "e.g. Adekanbi",
                      onChanged: (v) {
                        setState(() {
                          childsLastName = v;
                        });
                      },
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
                          hint: "DD",
                          onChanged: (v) {
                            setState(() {
                              day = v;
                            });
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomTextField(
                          headerLess: true,
                          hint: "MM",
                          onChanged: (v) {
                            setState(() {
                              month = v;
                            });
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(2),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CustomTextField(
                          headerLess: true,
                          hint: "YYYY",
                          onChanged: (v) {
                            setState(() {
                              year = v;
                            });
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                        ),
                      ),
                    ]),
                    SizedBox(height: 20),
                    CustomDropDown(
                      header: "Select child's level of understanding",
                      intialValue: null,
                      onSelected: (v) {
                        setState(() {
                          childsLevelOfUnderstanding = v;
                        });
                      },
                      items: levelOfUnderstanding
                          .map((e) => CustomDropDownItem(value: e, text: e))
                          .toList(),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: "Next",
                      onPressed: () {
                        ChildDetails childDetails = ChildDetails(
                          dob: childDOB,
                          firstname: childsFirstName,
                          lastname: childsLastName,
                          levelOfUnderstanding: childsLevelOfUnderstanding,
                        );
                        pushTo(
                          context,
                          RegisterGuardianPage(
                            initialChildDetails: childDetails,
                          ),
                        );
                      },
                      validator: validator,
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

  String day = "";
  String month = "";
  String year = "";

  bool validator() {
    childDOB = "$year/$month/$day";
    return childsFirstName.isNotEmpty &&
        childsLastName.isNotEmpty &&
        childDOB.isNotEmpty &&
        childsLevelOfUnderstanding.isNotEmpty;
  }

  String childsFirstName = "";
  String childsLastName = "";
  String childDOB = "";
  String childsLevelOfUnderstanding = "";

  List<String> levelOfUnderstanding = ["Low", "Average", "High"];
}
