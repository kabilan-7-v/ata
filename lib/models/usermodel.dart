class UserModel {
  final String firstname;
  final String lastname;
  final String email;
  final String phno;

  UserModel(
      {required this.firstname,
      required this.lastname,
      required this.email,
      required this.phno});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        firstname: json['firstName'],
        lastname: json['lastName'] ?? "Null",
        email: json['email'],
        phno: json['phoneNumber'] ?? "Null");
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstname,
      "lastName": lastname,
      "email": email,
      "phoneNumber": phno,
    };
  }
}
