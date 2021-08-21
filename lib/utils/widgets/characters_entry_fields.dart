import 'dart:async';

import 'package:auti_pharm/utils/styles/color_utils.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';

class CharactersEntryFields extends StatefulWidget {
  final Function(String code) onConfirm;
  final int numberOfCharacters;
  final Future Function() onResend;

  const CharactersEntryFields({
    Key key,
    this.onConfirm,
    this.onResend,
    @required this.numberOfCharacters,
  }) : super(key: key);

  @override
  _CharactersEntryFieldsState createState() => _CharactersEntryFieldsState();
}

class _CharactersEntryFieldsState extends State<CharactersEntryFields> {
  List<TextEditingController> controllers = [];
  List<FocusNode> nodes = [];
  List<String> code = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.numberOfCharacters; i++) {
      controllers.add(TextEditingController());
      nodes.add(FocusNode());
      code.add("");
    }
  }

  bool hasClicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 10),
          Row(
            children: List.generate(
              widget.numberOfCharacters,
              (index) {
                return Expanded(
                  child: Container(
                    height: 77,
                    width: 38,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: overlayColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: TextField(
                        cursorColor: buttonColor,
                        textAlign: TextAlign.center,
                        focusNode: nodes[index],
                        controller: controllers[index],
                        keyboardType: TextInputType.number,
                        style: TextStyle(color: Colors.white),
                        onChanged: (value) {
                          List<String> characters = value.split("");
                          int lastRequestableIndex = index;
                          if (characters.length > 1) {
                            for (int i = 0; i < characters.length; i++) {
                              if (lastRequestableIndex < nodes.length) {
                                controllers[lastRequestableIndex].text =
                                    characters[i];
                                code[lastRequestableIndex] = characters[i];
                                lastRequestableIndex += 1;
                              } else {
                                break;
                              }
                            }

                            lastRequestableIndex =
                                lastRequestableIndex < nodes.length
                                    ? lastRequestableIndex
                                    : lastRequestableIndex - 1;
                            nodes[lastRequestableIndex].requestFocus();
                            controllers[lastRequestableIndex].selection =
                                TextSelection.collapsed(offset: 1);
                          } else if (characters.length == 1) {
                            code[index] = characters[0];
                            if (index + 1 < nodes.length) {
                              nodes[index + 1].requestFocus();
                            }
                          } else {
                            if (index - 1 >= 0) {
                              nodes[index - 1].requestFocus();
                            }
                            code[index] = "";
                          }
                          setState(() {});
                        },
                        decoration: InputDecoration.collapsed(hintText: ""),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          CustomButton(
            expanded: true,
            text: "Next",
            onPressed: () {
              widget.onConfirm(code.join(""));
            },
            validator: () => !code.contains(""),
          ),
        ],
      ),
    );
  }
}
