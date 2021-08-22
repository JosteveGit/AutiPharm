class LoginDetails {
  final String email;
  final String password;

  LoginDetails({this.email, this.password});
}

class RegisterDetails {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;

  RegisterDetails({this.name, this.email, this.password, this.phoneNumber});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "walletBalance": 0.0,
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
