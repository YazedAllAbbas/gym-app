import 'package:final_project/core/const_data/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

class EditProfileUser {
  static void showEditDialog(BuildContext context, String title,
      String currentValue, Function(String) onSave) {
    TextEditingController controller =
        TextEditingController(text: currentValue);

    Get.dialog(
      AlertDialog(
        title: Text("Edit $title"),
        content: TextField(
          controller: controller,
          keyboardType: title.toLowerCase() == "phone"
              ? TextInputType.number
              : title.toLowerCase() == "email"
                  ? TextInputType.emailAddress
                  : TextInputType.text,
          maxLength: title.toLowerCase() == "phone" ? 10 : null,
          decoration: InputDecoration(
            hintText: "Enter new $title",
            counterText: '',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final newValue = controller.text.trim();

              if (newValue.isEmpty) {
                Get.snackbar(
                  "Invalid Input",
                  "Please enter a value.",
                  backgroundColor: Colors.redAccent,
                  colorText: Colors.white,
                );
                return;
              }

              if (newValue == currentValue) {
                Get.back();
                return;
              }

              if (title.toLowerCase() == "phone") {
                final isValidPhone = RegExp(r'^\d{10}$').hasMatch(newValue);
                if (!isValidPhone) {
                  Get.snackbar(
                    "Invalid Phone",
                    "Phone number must be exactly 10 digits.",
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                  );
                  return;
                }
              }

              if (title.toLowerCase() == "email") {
                final isValidEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                    .hasMatch(newValue);
                if (!isValidEmail) {
                  Get.snackbar(
                    "Invalid Email",
                    "Please enter a valid email address.",
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                  );
                  return;
                }
              }

              onSave(newValue);
              Get.back();
            },
            child: const Text("Save"),
          ),
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  static void showSelectDialog(BuildContext context, String title,
      String currentValue, Function(String) onSave) {
    List<String> options = [];

    switch (title.toLowerCase()) {
      case "gender":
        options = ["male", "female"];
        break;
      case "experianse_level":
        options = ["beginner", "intermediate", "advanced"];
        break;
      case "goal":
        options = ["lose_weight", "build_muscle", "endurance"];
        break;
      default:
        options = [];
    }

    if (options.isEmpty) return;

    String selectedValue = currentValue;

    Get.dialog(
      AlertDialog(
        title: Text("Select $title"),
        content: StatefulBuilder(
          builder: (context, setState) {
            return DropdownButton<String>(
              isExpanded: true,
              value: selectedValue,
              items: options
                  .map((option) => DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      ))
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedValue = value;
                  });
                }
              },
            );
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (selectedValue == currentValue) {
                Get.back();
                return;
              }

              onSave(selectedValue);
              Get.back();
            },
            child: const Text("Save"),
          ),
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
        ],
      ),
    );
  }

  static void showHeightAndWeightDialog(BuildContext context, String title,
      double currentValue, Function(double) onSave) {
    double selectedValue = currentValue;
    int wholePart = selectedValue.toInt();
    int decimalPart = ((selectedValue - wholePart) * 10).toInt();

    Get.bottomSheet(
      StatefulBuilder(
        builder: (context, setState) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Select $title",
                  style:  TextStyle(
                      fontSize: 20,
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SourceSerif4"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NumberPicker(
                      value: wholePart,
                      minValue: title == "height" ? 140 : 50,
                      maxValue: title == "height" ? 200 : 100,
                      step: 1,
                      onChanged: (value) {
                        setState(() {
                          wholePart = value;
                          selectedValue = wholePart + (decimalPart / 10);
                        });
                      },
                    ),
                    const Text(
                      ".",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    NumberPicker(
                      value: decimalPart,
                      minValue: 0,
                      maxValue: 9,
                      step: 1,
                      onChanged: (value) {
                        setState(() {
                          decimalPart = value;
                          selectedValue = wholePart + (decimalPart / 10);
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        title == "height" ? "cm" : "kg",
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                            fontFamily: "SourceSerif4",
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (selectedValue == currentValue) {
                          Get.back(); // إغلاق الـ Dialog
                          return;
                        }

                        onSave(selectedValue);
                        Get.back();
                      },
                      child:  Text(
                        "Save",
                        style: TextStyle(
                            fontSize: 20,
                            color: AppColor.primaryColor,
                            fontFamily: "SourceSerif4",
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.back(),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            fontFamily: "SourceSerif4",
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
      isScrollControlled: true,
    );
  }
}
