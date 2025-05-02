import 'dart:convert';

import 'package:final_project/models/exersice_model/exersice_model.dart';
import 'package:final_project/models/user_info_model/user_info_model.dart';

class ProgramModel {
  int id;
  String description;
  UserInfoModel coach;
  UserInfoModel trainer;
  List<ExerciseElement> exercises;
  DateTime createdAt;

  ProgramModel({
    required this.id,
    required this.description,
    required this.coach,
    required this.trainer,
    required this.exercises,
    required this.createdAt,
  });

  factory ProgramModel.fromRawJson(String str) =>
      ProgramModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProgramModel.fromJson(Map<String, dynamic> json) => ProgramModel(
        id: json["id"],
        description: json["description"],
        coach: UserInfoModel.fromJson(json["coach"]),
        trainer: UserInfoModel.fromJson(json["trainer"]),
        exercises: List<ExerciseElement>.from(
            json["exercises"].map((x) => ExerciseElement.fromJson(x))),
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "coach": coach.toJson(),
        "trainer": trainer.toJson(),
        "exercises": List<dynamic>.from(exercises.map((x) => x.toJson())),
        "created_at": createdAt.toIso8601String(),
      };
}

class ExerciseElement {
  String day;
  int sets;
  int reps;
  ExerciseModel exercise;

  ExerciseElement({
    required this.day,
    required this.sets,
    required this.reps,
    required this.exercise,
  });

  factory ExerciseElement.fromJson(Map<String, dynamic> json) =>
      ExerciseElement(
        day: json["day"],
        sets: json["sets"],
        reps: json["reps"],
        exercise: ExerciseModel.fromJson(json["exercise"]),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "sets": sets,
        "reps": reps,
        "exercise": exercise.toJson(),
      };
}
