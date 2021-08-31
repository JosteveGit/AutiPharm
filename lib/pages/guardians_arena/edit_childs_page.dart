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

class EditChildsPage extends StatefulWidget {
  final Child child;
  const EditChildsPage({Key key, this.child}) : super(key: key);

  @override
  _EditChildsPageState createState() => _EditChildsPageState();
}

class _EditChildsPageState extends State<EditChildsPage> {
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController dayController;
  TextEditingController monthController;
  TextEditingController yearController;

  @override
  void initState() {
    firstNameController = TextEditingController(text: widget.child.firstname);
    lastNameController = TextEditingController(text: widget.child.lastname);
    List<String> dob = widget.child.dob.split("/");
    dayController = TextEditingController(text: dob.last);
    monthController = TextEditingController(text: dob[1]);
    yearController = TextEditingController(text: dob.first);
    levelOfUnderstanding.remove(widget.child.levelOfUnderstanding);
    levelOfUnderstanding.add(widget.child.levelOfUnderstanding);
    levelOfUnderstanding = levelOfUnderstanding.reversed.toList();
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
                    "Edit Profile",
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
                        header: "Child's First Name",
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        headerColor: Colors.black,
                        textEditingController: firstNameController,
                        border: Border.all(color: Color(0xff88B5C4)),
                      ),
                      SizedBox(height: 20),
                      CustomTextField(
                        header: "Child's Last Name",
                        backgroundColor: Colors.white,
                        textColor: Colors.black,
                        headerColor: Colors.black,
                        textEditingController: lastNameController,
                        border: Border.all(color: Color(0xff88B5C4)),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Child’s Date of Birth",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              headerLess: true,
                              hint: "DD",
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              headerColor: Colors.black,
                              textEditingController: dayController,
                              border: Border.all(color: Color(0xff88B5C4)),
                              onChanged: (v) {
                                setState(() {
                                  // day = v;
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
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              headerColor: Colors.black,
                              textEditingController: monthController,
                              border: Border.all(color: Color(0xff88B5C4)),
                              onChanged: (v) {
                                setState(() {
                                  // month = v;
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
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              headerColor: Colors.black,
                              textEditingController: yearController,
                              border: Border.all(color: Color(0xff88B5C4)),
                              onChanged: (v) {
                                setState(() {
                                  // year = v;
                                });
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomDropDown(
                        header: "Select child's level of understanding",
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
                        items: levelOfUnderstanding
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

  List<String> levelOfUnderstanding = ["Low", "Average", "High"];
}
