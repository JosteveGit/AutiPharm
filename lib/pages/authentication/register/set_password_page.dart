import 'package:auti_pharm/core/models/authentication_details.dart';
import 'package:auti_pharm/utils/functions/string_utils.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:auti_pharm/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'set_arena_pin_page.dart';

class SetPasswordPage extends StatefulWidget {
  final RegisterDetails registerDetails;
  const SetPasswordPage({Key key, this.registerDetails}) : super(key: key);

  @override
  _SetPasswordPageState createState() => _SetPasswordPageState();
}

class _SetPasswordPageState extends State<SetPasswordPage> {
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
                "Set Password",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Kindly set a password to keep your account secure",
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
                      header: "Password",
                      onChanged: (v) {
                        setState(() {
                          password = v;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      header: "Confirm password",
                      onChanged: (v) {
                        setState(() {
                          confirmPassword = v;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: "Next",
                      validator: () =>
                          isValidPassword(password) &&
                          password == confirmPassword,
                      onPressed: () {
                        RegisterDetails registerDetails =
                            widget.registerDetails;
                        registerDetails.password = password;
                        pushTo(
                          context,
                          SetArenaPinPage(
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

  String password = "";
  String confirmPassword = "";
}
