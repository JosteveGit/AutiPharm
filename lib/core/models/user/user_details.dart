class UserDetails {
  String uid;
  Details details;

  UserDetails({this.details, this.uid});

  UserDetails.fromJson(Map<String, dynamic> json) {
    uid = json["uid"].toString();
    details =
        json['Details'] != null ? new Details.fromJson(Map.from(json['Details'])) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.details != null) {
      data['Details'] = this.details.toJson();
    }
    data["uid"] = uid;
    return data;
  }

  @override
  String toString() {
    return toJson().toString();
  }
}

class Details {
  String arenaPin;
  List<Child> children;
  String email;
  String name;
  String relationshipWithChild;

  Details(
      {this.arenaPin,
      this.children,
      this.email,
      this.name,
      this.relationshipWithChild});

  Details.fromJson(Map<String, dynamic> json) {
    arenaPin = json['arenaPin'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((k, v) {
        children.add(new Child.fromJson(Map.from(v))..id = k);
      });
    }
    email = json['email'];
    name = json['name'];
    relationshipWithChild = json['relationshipWithChild'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['arenaPin'] = this.arenaPin;
    if (this.children != null) {
      data['children'] = this.children.map((v) => v.toJson()).toList();
    }
    data['email'] = this.email;
    data['name'] = this.name;
    data['relationshipWithChild'] = this.relationshipWithChild;
    return data;
  }
}

class Child {
  String dob;
  String firstname;
  String lastname;
  String levelOfUnderstanding;
  String id;

  Child(
      {this.dob, this.firstname, this.lastname, this.levelOfUnderstanding});

  Child.fromJson(Map<String, dynamic> json) {
    dob = json['dob'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    levelOfUnderstanding = json['levelOfUnderstanding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dob'] = this.dob;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['levelOfUnderstanding'] = this.levelOfUnderstanding;
    return data;
  }
}

