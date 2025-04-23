class DayProgram {
  final String day;
  List<int> exercises;
  int sets;
  int reps;

  DayProgram({
    required this.day,
    required this.exercises,
    this.sets = 3,
    this.reps = 10,
  });

  Map<String, dynamic> toJson() {
    return {
      'day': day,
      'sets': sets,
      'reps': reps,
      'exercises': exercises,
    };
  }
}