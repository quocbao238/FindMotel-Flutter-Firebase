import 'dart:convert';

/*

{
    "username":"AceBi",
    "address":"99 Le Van Viet, Thu Duc, Ho Chi Minh",
    "email":"email",
    "avatarUrl":"avatar.jpg",
    "uid":"123213213"
}

*/

class Employer {
  Employer({
    this.username,
    this.address,
    this.email,
    this.avatarUrl,
    this.uid,
  });

  String username;
  String address;
  String email;
  String avatarUrl;
  String uid;

  factory Employer.fromJson(Map<String, dynamic> json) => Employer(
        username: json["username"],
        address: json["address"],
        email: json["email"],
        avatarUrl: json["avatarUrl"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "address": address,
        "email": email,
        "avatarUrl": avatarUrl,
        "uid": uid,
      };

  static Employer employerFromJson(String str) =>
      Employer.fromJson(json.decode(str));

  static String employerToJson(Employer data) => json.encode(data.toJson());
}
