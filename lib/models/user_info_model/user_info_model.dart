import 'dart:convert';

class UserInfoModel {
    String email;
    int id;
    String username;
    String firstName;
    String lastName;
    dynamic phone;
    dynamic weight;
    dynamic height;
    String gender;
    String goal;
    String experianseLevel;
    String userType;

    UserInfoModel({
        required this.email,
        required this.id,
        required this.username,
        required this.firstName,
        required this.lastName,
        required this.phone,
        required this.weight,
        required this.height,
        required this.gender,
        required this.goal,
        required this.experianseLevel,
        required this.userType,
    });

    factory UserInfoModel.fromRawJson(String str) => UserInfoModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
        email: json["email"],
        id: json["id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        weight: json["weight"],
        height: json["height"],
        gender: json["gender"],
        goal: json["goal"],
        experianseLevel: json["experianse_level"],
        userType: json["user_type"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "weight": weight,
        "height": height,
        "gender": gender,
        "goal": goal,
        "experianse_level": experianseLevel,
        "user_type": userType,
    };
}