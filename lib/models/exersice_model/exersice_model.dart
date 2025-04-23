import 'dart:convert';

class ExerciseModel {
  int exerciseId;
  String name;
  String muscleGroup;
  String? machine;
  String description;

  ExerciseModel({
    required this.exerciseId,
    required this.name,
    required this.muscleGroup,
    required this.machine,
    required this.description,
  });

  factory ExerciseModel.fromRawJson(String str) =>
      ExerciseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
        exerciseId: json["exercise_id"],
        name: json["name"],
        muscleGroup: json["muscle_group"],
        machine: json["machine"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "exercise_id": exerciseId,
        "name": name,
        "muscle_group": muscleGroup,
        "machine": machine,
        "description": description,
      };
  static List<ExerciseModel> exercises = [];
}
