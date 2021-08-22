import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

FirebaseAuth auth;
FirebaseDatabase database;
FirebaseStorage storage = FirebaseStorage.instance;


SharedPreferences preferences;
