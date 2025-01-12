class UserModel {
  final String userName;
  final String email;
  final String phno;
  final String? bio;
  final String? image;
  final String? dateofbirth;
  final String? gender;
  final String? userid;

  UserModel(
      {required this.userName,
      required this.email,
      required this.phno,
      required this.bio,
      required this.image,
      required this.dateofbirth,
      required this.gender,
      required this.userid});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userName: json['userName'] ?? "NULL",
        email: json['email'] ?? "null",
        phno: json['phoneNumber'] ?? "Null",
        bio: json['bio'] ?? "Null",
        image: json['image'] ?? "Null",
        dateofbirth: json['dateOfBirth'] ?? "Null",
        gender: json['gender'] ?? "Null",
        userid: json['_id'] ?? "kabi");
  }

  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      "email": email,
      "phoneNumber": phno,
      "bio": bio ?? "null",
      "image": image ?? "null",
      "dateOfBirth": dateofbirth ?? "null",
      "gender": gender ?? "null",
      "userid": userid ?? "null"
    };
  }
}

