import 'package:final_project/core/class/circular_progress_indicator_custom.dart';
import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/core/service/session/user_info_controller.dart';
import 'package:final_project/view/home/drawer/screens/profile_screen.dart';
import 'package:final_project/view/home/drawer/widget/list_tile_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DrawerScreen extends StatelessWidget {
  DrawerScreen({super.key});
  UserController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          ListView(
            children: [
              SizedBox(
                height: 170,
                child: GetBuilder<UserController>(
                  builder: (controller) => UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      color: AppColor.primaryColor,
                    ),
                    currentAccountPictureSize: const Size(60, 60),
                    accountName: Text(
                      controller.currentUser!.firstName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "SourceSerif4",
                      ),
                    ),
                    accountEmail: Text(
                      controller.currentUser!.email.length > 20
                          ? '${controller.currentUser!.email.substring(0, 20)}...'
                          : controller.currentUser!.email,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "SourceSerif4",
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      child: Text(controller.currentUser!.firstName.isNotEmpty
                          ? controller.currentUser!.firstName[0]
                          : '?'),
                    ),
                  ),
                ),
              ),
              ListTileDrawer(
                fun: () {
                  Get.to(const ProfileScreen());
                },
                icon: Icons.person,
                test: "Profile",
              ),
              ListTileDrawer(
                test: "Delete account",
                icon: Icons.person_off_rounded,
                fun: () {
                  controller.deleteAccount();
                },
              ),
              ListTileDrawer(
                  test: "Log out", icon: Icons.person_remove, fun: () {}),
              ListTileDrawer(
                fun: () {},
                icon: Icons.perm_contact_calendar,
                test: "Coaches",
              ),
              ListTileDrawer(
                fun: () {},
                icon: Icons.person_add_alt_rounded,
                test: "Invite friends",
              ),
              ListTileDrawer(
                fun: () {},
                icon: Icons.info,
                test: "About the app",
              ),
              ListTileDrawer(
                fun: () {},
                icon: Icons.help,
                test: "Help",
              ),
              ListTileDrawer(
                fun: () {},
                icon: Icons.developer_board,
                test: "App developers",
              ),
              ListTileDrawer(
                fun: () {},
                icon: Icons.exit_to_app,
                test: "Exit",
              ),
            ],
          ),
          GetBuilder<UserController>(
            builder: (controller) {
              return controller.isUserLoading
                  ? const CircularProgressIndicatorCustom()
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
