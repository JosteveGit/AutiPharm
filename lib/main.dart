import 'package:auti_pharm/setups/app_setups.dart';
import 'package:flutter/material.dart';

import 'pages/splash_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppSetups.run();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutiPharm',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}
