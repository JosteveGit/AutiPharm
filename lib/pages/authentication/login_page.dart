import 'package:auti_pharm/pages/authentication/register/register_child_page.dart';
import 'package:auti_pharm/pages/guardians_arena/guardians_dashboard_page.dart';
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
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      header: "Password",
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    SizedBox(height: 20),
                    CustomButton(
                      text: "Sign In",
                      onPressed: () {
                        pushTo(context, GuardiansDashboardPage());
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
}
