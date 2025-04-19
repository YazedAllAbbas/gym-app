// import 'dart:convert';

// List<Coach> coachFromJson(String str) => List<Coach>.from(json.decode(str).map((x) => Coach.fromJson(x)));

// String coachToJson(List<Coach> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Coach {
//     String email;
//     int id;
//     String username;
//     String firstName;
//     String lastName;
//     String phone;
//     double weight;
//     double height;
//     String gender;
//     String goal;
//     String experianseLevel;
//     String userType;

//     Coach({
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

//     factory Coach.fromJson(Map<String, dynamic> json) => Coach(
//         email: json["email"],
//         id: json["id"],
//         username: json["username"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         phone: json["phone"],
//         weight: json["weight"]?.toDouble(),
//         height: json["height"]?.toDouble(),
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