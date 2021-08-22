import 'dart:io';

import 'package:auti_pharm/core/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseSetup {
  static Future<void> run() async {
    final app = await FirebaseApp.configure(
      name: "AutiPharm",
      options: Platform.isIOS
          ? const FirebaseOptions(
              googleAppID: '1:968711974841:ios:bc68dfea492757da0c9068',
              apiKey: 'AIzaSyD8OZxKtm7t6Hc30gRhPe3Pb8YyZL1n7Ds',
              gcmSenderID: '968711974841',
              databaseURL: 'https://autipharm-default-rtdb.firebaseio.com',
              storageBucket: "gs://autipharm.appspot.com",
            )
          : const FirebaseOptions(
              googleAppID: '1:968711974841:android:691a19eb8c1e2c450c9068',
              apiKey: 'AIzaSyANn5_eHsIRS8I1qTUsGp6rvBCsWMJhZtw',
              databaseURL: 'https://autipharm-default-rtdb.firebaseio.com',
              storageBucket: "gs://autipharm.appspot.com",
            ),
    );
    database = FirebaseDatabase(app: app);
    storage = FirebaseStorage(app: app);
    auth = FirebaseAuth.fromApp(app);
  }
}
