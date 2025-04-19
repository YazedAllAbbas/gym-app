import 'package:final_project/models/section_model/section.dart';

class StaticScectionData {
  static List<Section> sections = [
    Section("Me", "Personal system", "assets/images/me.png", () {}),
    Section("Exercies", "Comprehensive exercise library",
        "assets/images/exercies.jpg", () {}),
    Section("Chat", "Conversations between trainers and trainees",
        "assets/images/chat.jpg", () {}),
    Section("Posts", "Interactive content between trainers",
        "assets/images/post.jpg", () {}),
    Section("Nutrition", "Nutrition tips and plans",
        "assets/images/nutrition.png", () {}),
    Section("Restaurants", "List of healthy restaurants",
        "assets/images/restaurants.png", () {}),
  ];
}
