import 'package:final_project/models/section_model/section.dart';

class StaticCoachScectionData {
  static List<Section> coachSections = [
    Section("My trainees", "all my trainees", "assets/images/my_trainees.png",
        () {}),
    Section("requests", "requests for new trainees",
        "assets/images/requests.png", () {}),
    Section("Exercies", "Comprehensive exercise library",
        "assets/images/exercies.jpg", () {}),
    Section("Chat", "Conversations between trainers and trainees",
        "assets/images/chat.png", () {}),
    Section("Posts", "Interactive content between trainers",
        "assets/images/post.png", () {}),
    Section("Restaurants", "List of healthy restaurants",
        "assets/images/restaurants.png", () {}),
  ];
}
