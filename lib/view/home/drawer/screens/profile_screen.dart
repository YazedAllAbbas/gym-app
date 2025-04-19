import 'package:final_project/core/class/circular_progress_indicator_custom.dart';
import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/service/session/user_info_controller.dart';
import 'package:final_project/view/home/drawer/screens/edit_profile_user/edit_profile_user.dart';
import 'package:final_project/view/home/drawer/widget/list_tile_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(
      builder: (userController) {
        return Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            title: const Text(
              "My Profile",
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "SourceSerif4",
                  shadows: [
                    Shadow(
                        color: Colors.black26,
                        blurRadius: 0.2,
                        offset: Offset(1, 2))
                  ]),
            ),
            centerTitle: true,
            backgroundColor: AppColor.primaryColor,
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: AppColor.primaryColor, width: 3),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 10),
                          child: Text(
                            "Me Profile",
                            style: TextStyle(
                                color: AppColor.primaryColor,
                                fontSize: 25,
                                shadows: [
                                  Shadow(
                                      color: Colors.black12,
                                      blurRadius: 0.9,
                                      offset: Offset(1, 2))
                                ],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        ListTileProfile(
                          imageurl: "assets/images/first_name.png",
                          title: "first name",
                          value: userController.currentUser!.firstName,
                          color: Colors.blueGrey.shade200,
                          fun: () {
                            EditProfileUser.showEditDialog(
                                context,
                                "first_name",
                                userController.currentUser!.firstName,
                                (newValue) {
                              userController.updateUserField(
                                  "first_name", newValue);
                            });
                          },
                        ),
                        ListTileProfile(
                          imageurl: "assets/images/profile_icon.png",
                          title: "last_name",
                          value: userController.currentUser!.lastName,
                          color: Colors.blueGrey,
                          fun: () {
                            EditProfileUser.showEditDialog(context, "last name",
                                userController.currentUser!.lastName,
                                (newValue) {
                              userController.updateUserField(
                                  "last_name", newValue);
                            });
                          },
                        ),
                        ListTileProfile(
                          imageurl: "assets/images/email_icon.png",
                          title: "email",
                          color: Colors.redAccent,
                          value: userController.currentUser!.email,
                          fun: () {
                            EditProfileUser.showEditDialog(context, "email",
                                userController.currentUser!.email, (newValue) {
                              userController.updateUserField("email", newValue);
                            });
                          },
                        ),
                        ListTileProfile(
                          imageurl: "assets/images/phone_icon.png",
                          title: "phone",
                          color: Colors.green,
                          value: userController.currentUser!.phone.toString(),
                          fun: () {
                            EditProfileUser.showEditDialog(context, "phone",
                                userController.currentUser!.phone, (newValue) {
                              userController.updateUserField("phone", newValue);
                            });
                          },
                        ),
                        ListTileProfile(
                          imageurl: "assets/images/weight_icon.png",
                          title: "weight",
                          color: Colors.pinkAccent,
                          value: userController.currentUser!.weight.toString(),
                          fun: () {
                            EditProfileUser.showHeightAndWeightDialog(
                              context,
                              "weight",
                              userController.currentUser!.weight,
                              (newValue) {
                                userController.updateUserField(
                                    "weight", newValue.toString());
                              },
                            );
                          },
                        ),
                        ListTileProfile(
                          imageurl: "assets/images/height_icon.png",
                          title: "height",
                          color: Colors.blue,
                          value: "${userController.currentUser!.height} cm",
                          fun: () {
                            EditProfileUser.showHeightAndWeightDialog(
                              context,
                              "height",
                              userController.currentUser!.height,
                              (newValue) {
                                userController.updateUserField(
                                    "height", newValue.toString());
                              },
                            );
                          },
                        ),
                        ListTileProfile(
                          imageurl: "assets/images/gender_icon.png",
                          title: "gender",
                          color: Colors.grey,
                          value: userController.currentUser!.gender,
                          fun: () {
                            EditProfileUser.showSelectDialog(
                              context,
                              "gender",
                              userController.currentUser!.gender,
                              (newValue) {
                                userController.updateUserField(
                                    "gender", newValue);
                              },
                            );
                          },
                        ),
                        ListTileProfile(
                          imageurl: "assets/images/experience_icon.png",
                          title: "experience",
                          color: Colors.lightBlueAccent,
                          value: userController.currentUser!.experianseLevel,
                          fun: () {
                            EditProfileUser.showSelectDialog(
                              context,
                              "experianse_level",
                              userController.currentUser!.experianseLevel,
                              (newValue) {
                                userController.updateUserField(
                                    "experianse_level", newValue);
                              },
                            );
                          },
                        ),
                        ListTileProfile(
                          imageurl: "assets/images/goal_icon.png",
                          title: "goal",
                          color: Colors.lightGreen,
                          value: userController.currentUser!.goal,
                          fun: () {
                            EditProfileUser.showSelectDialog(
                              context,
                              "goal",
                              userController.currentUser!.goal,
                              (newValue) {
                                userController.updateUserField(
                                    "goal", newValue);
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (userController.isUserLoading)
                const CircularProgressIndicatorCustom(),
            ],
          ),
        );
      },
    );
  }
}
