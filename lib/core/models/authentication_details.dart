class LoginDetails {
  final String email;
  final String password;

  LoginDetails({this.email, this.password});
}

class RegisterDetails {
  final String name;
  final String email;
  String password;
  final String phoneNumber;
  final String relationshipWithChild;
  final ChildDetails initialChildDetails;
  String arenaPin;

  RegisterDetails({
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.initialChildDetails,
    this.relationshipWithChild,
    this.arenaPin,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "arenaPin": arenaPin,
      "relationshipWithChild": relationshipWithChild,
      "children": {
        "initialChild": initialChildDetails.toMap(),
      }
    };
  }
}

class ChildDetails {
  final String firstname;
  final String lastname;
  final String dob;
  final String levelOfUnderstanding;

  ChildDetails({
    this.firstname,
    this.lastname,
    this.dob,
    this.levelOfUnderstanding,
  });

  Map<String, dynamic> toMap() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "dob": dob,
      "levelOfUnderstanding": levelOfUnderstanding,
    };
  }
}

class AuthenticationResponse {
  final String message;
  final String userID;
  final bool authenticationFailed;

  AuthenticationResponse({
    this.message,
    this.userID,
    this.authenticationFailed = false,
  });
}
