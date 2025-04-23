import 'package:final_project/models/exersice_model/exersice_model.dart';
import 'package:flutter/material.dart';
import 'package:final_project/core/const_data/app_colors.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final ExerciseModel exercise;
  const ExerciseDetailsScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFF3F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: AppColor.primaryColor),
        title: Text(
          exercise.name,
          style: const TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
            fontFamily: "SourceSerif4",
            // color: AppColor.primaryColor,
          ),
        ),
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Image.asset(
                        "assets/images/Pectoralis.png",
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.play_circle_outline_sharp,
                    color: Colors.blueGrey,
                    size: 72,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    exercise.muscleGroup,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      fontFamily: "SourceSerif4",
                      // color: AppColor.primaryColor,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.favorite_border,
                        color: AppColor.primaryColor,
                        size: 34,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: AppColor.primaryColor,
                        size: 32,
                      )),
                ],
              ),
              Text(
                exercise.machine == null ? "Cable Machine" : exercise.machine!,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  fontFamily: "SourceSerif4",
                  color: AppColor.primaryColor,
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.1, color: AppColor.primaryColor),
                  color: Colors.transparent.withOpacity(0.1),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 0,
                        color: Colors.white,
                        offset: Offset(0, 0))
                  ],
                ),
                child: const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "3",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            fontFamily: "SourceSerif4",
                            // color: AppColor.primaryColor,
                          ),
                        ),
                        Text(
                          "sets",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                            fontFamily: "SourceSerif4",
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "x",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                            fontFamily: "SourceSerif4",
                            // color: AppColor.primaryColor,
                          ),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w100,
                            fontFamily: "SourceSerif4",
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "4",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            fontFamily: "SourceSerif4",
                            // color: AppColor.primaryColor,
                          ),
                        ),
                        Text(
                          "reps",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w200,
                            fontFamily: "SourceSerif4",
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                exercise.description,
                style: const TextStyle(
                  fontSize: 18,
                  fontFamily: "SourceSerif4",
                  // height: 1.6,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
