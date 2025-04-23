import 'package:final_project/view/auth/login/screen/login_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/experianse_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/gender_selection_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/goal_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/height_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/phone_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/register_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/second_screen.dart';
import 'package:final_project/view/auth/register/screen/screens/usertype_screen.dart';
import 'package:final_project/view/auth/splash/screen/splash_screen.dart';
import 'package:final_project/view/coach/build_program/screen/build_program_screen.dart';
import 'package:final_project/view/home/coach_home_screen/screen/coach_home_screen.dart';

import 'package:final_project/view/home/trainer_home_screen/screen/trainer_home_screen.dart';
import 'package:final_project/view/coach/my_trainee/screen/my_trainee_screen.dart';
import 'package:final_project/view/coach/requests_screen/screen/requests_screen.dart';
import 'package:final_project/view/select_coach_screen/screen/select_coach_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  ////////////Auth////////////////
  GetPage(name: "/splashScreen", page: () => SplashScreen()),
  GetPage(name: "/loginScreen", page: () => const LoginScreen()),
  GetPage(name: "/registerScreen", page: () => const RegisterScreen()),
  GetPage(name: "/secondScreen", page: () => const SecondScreen()),
  GetPage(name: "/goalScreen", page: () => const GoalScreen()),
  GetPage(name: "/experianseScreen", page: () => const ExperianseScreen()),
  GetPage(name: "/phoneScreen", page: () => const PhoneScreen()),
  GetPage(name: "/usertypeScreen", page: () => const UsertypeScreen()),

  GetPage(name: "/heightScreen", page: () => HeightScreen()),
  GetPage(name: "/genderSelectionScreen", page: () => GenderSelectionScreen()),
  ///////////////home/////////////////////////////////

  GetPage(name: "/homeScreen", page: () => const TrainerHomeScreen()),
  GetPage(name: "/selectCoachScreen", page: () => const SelectCoachScreen()),

  GetPage(name: "/coachHomeScreen", page: () => const CoachHomeScreen()),
  GetPage(name: "/requestsScreen", page: () => const RequestsScreen()),
  GetPage(name: "/myTraineeScreen", page: () => const MyTraineeScreen()),
  //GetPage(name: "/makeProgramScreen", page: () => const BuildProgramScreen()),
  

  /////////////////profile////////////////////////

  //////////////////////////setting////////////////////////


];

//
