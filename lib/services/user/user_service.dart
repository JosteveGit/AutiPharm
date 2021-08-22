import 'dart:convert';
import 'package:auti_pharm/core/constants.dart';
import 'package:auti_pharm/core/models/user/user_details.dart';

class UserService {
  static Stream<UserDetails> getUserDetails() async* {
    yield* database
        .reference()
        .child("Users")
        .child(userDetails.uid)
        .onValue
        .map(
      (event) {
        try {
          var usersMap = Map<String, dynamic>.from(event.snapshot.value);
          String uid = userDetails.uid;
          userDetails = UserDetails.fromJson(usersMap)..uid = uid;
          preferences.setString("userDetails", jsonEncode(userDetails.toJson()));
          return userDetails;
        } catch (e) {
          return null;
        }
      },
    );
  }
}
