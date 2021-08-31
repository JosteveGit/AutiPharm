import 'package:auti_pharm/utils/navigation/navigator.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key key}) : super(key: key);

  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    "About Us",
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  Opacity(child: Icon(Icons.arrow_back_rounded), opacity: 0),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Who we are",
                style: TextStyle(
                  fontSize: 35
                ),
              ),
              SizedBox(height: 10),
              Text(note)
            ],
          ),
        ),
      ),
    );
  }

  String note = """Autipharm is a mobile application developed using flutter SDK and firebase real-time database aimed at teaching children with autism spectrum disorder how to identify their drug.

This application combines edutainment and applied behavioural analysis and was built using a design thinking approach.

It takes into account the child’s level of understanding as given by a caretaker which could be a parent, sibling or medical professional, and allows the child to take appropriate lessons in form of a game.

For more information, send us a mail at udofia.itohowo@bowen.edu.ng""";
}
