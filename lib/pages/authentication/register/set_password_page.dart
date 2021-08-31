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
                      obscureText: hidePassword,
                      suffix: Container(
                        height: 30,
                        child: FittedBox(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                hidePassword = !hidePassword;
                              });
                            },
                            icon: Icon(
                              hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Password must contain an uppercase letter, a lowercase letter, a number, a symbol and must be at least of length",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 30),
                    CustomTextField(
                      header: "Confirm password",
                      onChanged: (v) {
                        setState(() {
                          confirmPassword = v;
                        });
                      },
                      obscureText: confirmHidePassword,
                      suffix: Container(
                        height: 30,
                        child: FittedBox(
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                confirmHidePassword = !confirmHidePassword;
                              });
                            },
                            icon: Icon(
                              confirmHidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
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

  bool hidePassword = true;
  bool confirmHidePassword = true;

  String password = "";
  String confirmPassword = "";
}
