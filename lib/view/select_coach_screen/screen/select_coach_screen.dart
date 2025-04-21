import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/home/trainer_home_screen/screen/trainer_home_screen.dart';
import 'package:final_project/view/select_coach_screen/controller/select_coach_controller.dart';
import 'package:final_project/view/select_coach_screen/widget/coach_details_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCoachScreen extends StatelessWidget {
  const SelectCoachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final SelectCoachController controller = Get.put(SelectCoachController());
    return GetBuilder<SelectCoachController>(
        //  init: SelectCoachController(),
        builder: (controller) => Scaffold(
                body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: media.width * 0.13,
                    ),
                    const Text("Select a coach to start your fitness journey",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            //  fontWeight: FontWeight.w700,
                            fontFamily: 'SourceSerif4')),
                    SizedBox(
                      height: media.width * 0.12,
                    ),
                    controller.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Expanded(
                            child: ListView.builder(
                              itemCount: controller.coaches.length,
                              itemBuilder: (context, index) {
                                final coach = controller.coaches[index];
                                final isSelected =
                                    controller.selectedCoachIndex == index;

                                return GestureDetector(
                                  onTap: () {
                                    // controller.selectCoach(index);
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (_) => CoachDetailsSheet(
                                        coach: coach,
                                        onSendRequest: () {
                                          controller.selectCoach(index);
                                          controller.sendRequestToCoach(
                                              coach.id.toString());
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1.2,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          blurRadius: 6,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(children: [
                                      Text(
                                        coach.username,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontFamily: 'Poppins'),
                                      ),
                                      const SizedBox(height: 8),
                                    ]),
                                  ),
                                );
                              },
                            ),
                          ),
                    SizedBox(
                      height: media.width * 0.2,
                    ),
                    CustomButton(
                      text: 'Next',
                      onTap: () {
                        Get.to(TrainerHomeScreen());
                      },
                    ),
                  ],
                ),
              ),
            )));
  }
}
