import 'dart:convert';

import 'package:auti_pharm/core/constants.dart';
import 'package:auti_pharm/core/models/authentication_details.dart';
import 'package:auti_pharm/core/models/user/user_details.dart';
import 'package:auti_pharm/pages/authentication/register/register_child_page.dart';
import 'package:auti_pharm/pages/guardians_arena/guardians_dashboard_page.dart';
import 'package:auti_pharm/services/authentication/authentication_service.dart';
import 'package:auti_pharm/utils/functions/dialog_utils.dart';
import 'package:auti_pharm/utils/functions/string_utils.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:auti_pharm/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                "Welcome to\nAutipharm",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    CustomTextField(
                      header: "Email Address",
                      onChanged: (v) {
                        setState(() {
                          email = v;
                        });
                      },
                    ),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: "Sign In",
                      validator: () =>
                          isValidEmailAddress(email) && password.isNotEmpty,
                      onPressed: () {
                        login();
                        // pushTo(context, GuardiansDashboardPage());
                      },
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        pushTo(context, RegisterChildPage());
                      },
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
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

  String email = "";
  String password = "";

  void login() async {
    showLoader(context);
    AuthenticationResponse response = await AuthenticationService.login(
      LoginDetails(
        email: email,
        password: password,
      ),
    );
    pop(context);
    if (response.authenticationFailed) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          response.message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
    } else {
      String uid = response.userID;
      userDetails = UserDetails(uid: uid);
      preferences.setString("userDetails", jsonEncode(userDetails.toJson()));
      pushToAndClearStack(context, GuardiansDashboardPage());
    }
  }
}
