import 'dart:convert';

class RequestModel {
    int id;
    int userId;
    String trainerName;
    DateTime createdAt;

    RequestModel({
        required this.id,
        required this.userId,
        required this.trainerName,
        required this.createdAt,
    });

    factory RequestModel.fromRawJson(String str) => RequestModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory RequestModel.fromJson(Map<String, dynamic> json) => RequestModel(
        id: json["id"],
        userId: json["user_id"],
        trainerName: json["trainer_name"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "trainer_name": trainerName,
        "created_at": createdAt.toIso8601String(),
    };
}