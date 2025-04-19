// import 'dart:convert';

// class UserModel {
//     String token;
//     User user;

//     UserModel({
//         required this.token,
//         required this.user,
//     });

//     factory UserModel.fromRawJson(String str) => UserModel.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         token: json["token"],
//         user: User.fromJson(json["user"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "token": token,
//         "user": user.toJson(),
//     };
// }

// class User {
//     String email;
//     int id;
//     String username;
//     String firstName;
//     String lastName;
//     dynamic phone;
//     dynamic weight;
//     dynamic height;
//     String gender;
//     String goal;
//     String experianseLevel;
//     String userType;

//     User({
//         required this.email,
//         required this.id,
//         required this.username,
//         required this.firstName,
//         required this.lastName,
//         required this.phone,
//         required this.weight,
//         required this.height,
//         required this.gender,
//         required this.goal,
//         required this.experianseLevel,
//         required this.userType,
//     });

//     factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

//     String toRawJson() => json.encode(toJson());

//     factory User.fromJson(Map<String, dynamic> json) => User(
//         email: json["email"],
//         id: json["id"],
//         username: json["username"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         phone: json["phone"],
//         weight: json["weight"],
//         height: json["height"],
//         gender: json["gender"],
//         goal: json["goal"],
//         experianseLevel: json["experianse_level"],
//         userType: json["user_type"],
//     );

//     Map<String, dynamic> toJson() => {
//         "email": email,
//         "id": id,
//         "username": username,
//         "first_name": firstName,
//         "last_name": lastName,
//         "phone": phone,
//         "weight": weight,
//         "height": height,
//         "gender": gender,
//         "goal": goal,
//         "experianse_level": experianseLevel,
//         "user_type": userType,
//     };
// }