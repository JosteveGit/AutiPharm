import 'package:auti_pharm/core/constants.dart';
import 'package:auti_pharm/core/models/authentication_details.dart';
import 'package:auti_pharm/core/models/user/user_details.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/child_image.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:auti_pharm/utils/widgets/custom_drop_down.dart';
import 'package:auti_pharm/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GuardiansProfilePage extends StatefulWidget {
  const GuardiansProfilePage({
    Key key,
  }) : super(key: key);

  @override
  _GuardiansProfilePageState createState() => _GuardiansProfilePageState();
}

class _GuardiansProfilePageState extends State<GuardiansProfilePage> {
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController emailController;

  @override
  void initState() {
    firstNameController =
        TextEditingController(text: userDetails.details.firstName);
    lastNameController =
        TextEditingController(text: userDetails.details.lastName);
    emailController = TextEditingController(text: userDetails.details.email);
    relationshipOptions.remove(userDetails.details.relationshipWithChild);
    relationshipOptions.add(userDetails.details.relationshipWithChild);
    relationshipOptions = relationshipOptions.reversed.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
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
                    "Profile",
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  Opacity(child: Icon(Icons.arrow_back_rounded), opacity: 0),
                ],
              ),
              SizedBox(height: 27),
              Stack(
                overflow: Overflow.visible,
                children: [
                  ChildImage(),
                  Positioned(
                    bottom: 0,
                    right: -5,
                    child: Container(
                      child: Icon(
                        Icons.edit_rounded,
                        color: Colors.white,
                        size: 15,
                      ),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 27),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        header: "Guardian's First Name",
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        headerColor: Colors.black,
                        textEditingController: firstNameController,
                        border: Border.all(color: Color(0xff88B5C4)),
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        header: "Guardian's Last Name",
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        headerColor: Colors.black,
                        textEditingController: lastNameController,
                        border: Border.all(color: Color(0xff88B5C4)),
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        header: "Guardian's Email",
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        headerColor: Colors.black,
                        textEditingController: emailController,
                        border: Border.all(color: Color(0xff88B5C4)),
                      ),
                      SizedBox(height: 20),
                      CustomDropDown(
                        header: "Relationship with child",
                        headerColor: Colors.black,
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        border: Border.all(color: Color(0xff88B5C4)),
                        intialValue: null,
                        onSelected: (v) {
                          setState(() {
                            // childsLevelOfUnderstanding = v;
                          });
                        },
                        items: relationshipOptions
                            .map((e) => CustomDropDownItem(value: e, text: e))
                            .toList(),
                      ),
                      SizedBox(height: 20),
                      CustomButton(
                        text: "Save",
                        expanded: true,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> relationshipOptions = [
    "Parents",
    "Sibling",
    "Medical Professional",
    "Guardian",
  ];
}
