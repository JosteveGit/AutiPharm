import 'package:auti_pharm/pages/guardians_arena/guardians_dashboard_page.dart';
import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:auti_pharm/utils/widgets/characters_entry_fields.dart';
import 'package:auti_pharm/utils/widgets/custom_button.dart';
import 'package:auti_pharm/utils/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SetArenaPinPage extends StatefulWidget {
  const SetArenaPinPage({Key key}) : super(key: key);

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
                "Set Area Pin",
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
                        pushTo(context, GuardiansDashboardPage());
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
