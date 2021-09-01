import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:flutter/material.dart';

import 'characters_entry_fields.dart';

class EnterArenaPinDialog extends StatefulWidget {
  final String operation;
  const EnterArenaPinDialog({Key key, this.operation}) : super(key: key);

  @override
  _EnterArenaPinDialogState createState() => _EnterArenaPinDialogState();
}

class _EnterArenaPinDialogState extends State<EnterArenaPinDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        height: 380,
        width: 380,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Arena Pin",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Kindly enter pin to ${widget.operation}",
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              CharactersEntryFields(
                numberOfCharacters: 4,
                onConfirm: (v) {
                  pop(context, v);
                },
              ),
              Spacer(),
            ],
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: backgroundColor,
        ),
      ),
    );
  }
}
