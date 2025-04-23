import 'package:final_project/models/section_model/section.dart';
import 'package:final_project/view/exercises/exercises_screen/exercises_screen.dart';
import 'package:get/get.dart';

class StaticTrainerScectionData {
  static List<Section> trainersSections = [
    Section("Me", "Personal system", "assets/images/me.png", () {}),
    Section("Exercies", "Comprehensive exercise library",
        "assets/images/exercies.jpg", () {
      Get.to(() => ExercisesScreen());
    }),
    Section("Chat", "Conversations between trainers and trainees",
        "assets/images/chat.png", () {}),
    Section("Posts", "Interactive content between trainers",
        "assets/images/post.png", () {}),
    Section("Nutrition", "Nutrition tips and plans",
        "assets/images/nutrition.png", () {}),
    Section("Restaurants", "List of healthy restaurants",
        "assets/images/restaurants.png", () {}),
  ];
}
