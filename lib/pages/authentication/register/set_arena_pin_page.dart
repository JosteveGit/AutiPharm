import 'dart:convert';

import 'package:auti_pharm/core/constants.dart';
import 'package:auti_pharm/core/models/authentication_details.dart';
import 'package:auti_pharm/core/models/user/user_details.dart';
import 'package:auti_pharm/pages/guardians_arena/guardians_dashboard_page.dart';
import 'package:auti_pharm/services/authentication/authentication_service.dart';
import 'package:auti_pharm/utils/functions/dialog_utils.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/characters_entry_fields.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:auti_pharm/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SetArenaPinPage extends StatefulWidget {
  final RegisterDetails registerDetails;
  const SetArenaPinPage({Key key, this.registerDetails}) : super(key: key);

  @override
  _SetArenaPinPageState createState() => _SetArenaPinPageState();
}

class _SetArenaPinPageState extends State<SetArenaPinPage> {
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
                "Set Arena Pin",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Kindly set a pin to keep your arena secure",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 40),
              Expanded(
                child: ListView(
                  children: [
                    CharactersEntryFields(
                      numberOfCharacters: 4,
                      onConfirm: (v) {
                        RegisterDetails registerDetails =
                            widget.registerDetails;
                        registerDetails.arenaPin = v;
                        regiser(registerDetails);
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

  void regiser(RegisterDetails details) async {
    showLoader(context);
    AuthenticationResponse rep = await AuthenticationService.register(details);
    popLoader();
    if (rep.authenticationFailed) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          rep.message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ));
    } else {
      String uid = rep.userID;
      userDetails = UserDetails(uid: uid);
      preferences.setString("userDetails", jsonEncode(userDetails.toJson()));
      pushReplacementTo(context, GuardiansDashboardPage());
    }
  }
}
