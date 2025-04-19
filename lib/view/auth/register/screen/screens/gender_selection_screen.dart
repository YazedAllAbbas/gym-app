 import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project/core/const_data/app_colors.dart';
import 'package:final_project/view/auth/register/controller/register_controller.dart';
import 'package:final_project/view/auth/widget/custom_botton.dart';
import 'package:final_project/view/auth/widget/primary_title_widget.dart';
// import 'package:course_getx/views/height_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import '../controller/gender_controller.dart';
// import '../../custom_widgets/primary_title_widget.dart';

class GenderSelectionScreen extends StatelessWidget {
  final RegisterController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
      //  appBar: AppBar(),
        body: Padding(
              padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        ],
                      ),
                  

                SizedBox(
                      height: screenWidth * 0.1,
                    ),
              const PrimaryTitleWidget(text: "Select your Gender"),
              Expanded(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      FractionallySizedBox(
                        widthFactor: 0.45,
                        heightFactor: 0.5,
                        child: Obx(() => AnimatedContainer(
                              duration: const Duration(milliseconds: 600),
                              curve: Curves.easeInOut,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.6),
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                    offset: const Offset(0, 5),
                                  ),
                                ],
                                color: controller.selectedGenderIndex.value == 0
                                  //  ? Colors.blue
                                      ? AppColor.primaryColor2
                                        : AppColor.secondaryColor2,
                                  //  : Colors.pinkAccent,
                                    //   ? AppColor.
                                    // : Colors.pinkAccent,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(60),
                                  bottomRight: Radius.circular(60),
                                ),
                              ),
                            )),
                      ),
                      SizedBox(
                        width: screenWidth * 0.8,
                        height: screenHeight * 0.7,
                        child: Obx(() => CarouselSlider(
                              items: controller.genders.map((gender) {
                                return Obx(() {
                                  double scale = controller.genders
                                              .indexOf(gender) ==
                                          controller.selectedGenderIndex.value
                                      ? 1.2
                                      : 0.8;
                                  return Transform.scale(
                                    scale: scale,
                                    child: buildImage(
                                        gender.image, gender.caption),
                                  );
                                });
                              }).toList(),
                              options: CarouselOptions(
                                height: screenHeight * 0.5,
                                viewportFraction: 0.7,
                                enlargeCenterPage: true,
                                onPageChanged: (index, reason) {
                                  controller.updateSelectedGender(index);
                                },
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
          
              
                 CustomButton(
                text:     "Next",
                  onTap: () {
                        print('The gender is: ${controller.SelectedGender()}');
        
                Get.toNamed('/heightScreen');
                
                        },
                  ),
                
            
            
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, String caption) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Image.asset(
            urlImage,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          caption,
          style: const TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}