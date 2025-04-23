import '../const_data/const_data.dart';

class AppLink {
  //static String reg = "127.0.0.1";

  static String appRoot = "https://mohammedmoh.pythonanywhere.com";

  static String register = "$appRoot/register/";
  static String login = "$appRoot/login/";
  static String coaches = "$appRoot/coaches/";
  static String sendjoinrequest = "$appRoot/sendjoinrequest";
  static String getjoinrequests = "$appRoot/getjoinrequests";
  static String getuser = "$appRoot/user";
  static String getInfo = "$appRoot/getInfo/";
  static String responsetojoinrequest = "$appRoot/responsetojoinrequest";
  static String traineesWithSpecificCoach = "$appRoot/trainers";
  static String getExercises = "$appRoot/exercises/listexercises/";
  static String exercisesbymuscle = "$appRoot/exercises/by-muscle";

  static String makeprogram = "$appRoot/exercises/makeprogram";

  static String update_profile = "$appRoot/update_profile/";
  static String delete_account = "$appRoot/delete/";
  Map<String, String> getHeader() {
    Map<String, String> mainHeader = {
      'Content - Type': 'application/json',
      ' Accept': 'application/json',
      ' x - Requested - with': 'XMLHttpRequest',
    };
    return mainHeader;
  }

  Map<String, String> getHeaderToken() {
    Map<String, String> mainHeader = {
      'Content - Type': 'application/json',
      ' Accept': 'application/json',
      ' x - Requested - with': 'XMLHttpRequest',
      'Autherization': 'Bearer ${ConstData.token}',
    };
    return mainHeader;
  }
}
