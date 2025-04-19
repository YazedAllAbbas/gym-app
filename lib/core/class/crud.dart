import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:final_project/core/class/status_request.dart';
import 'package:final_project/core/const_data/const_data.dart';
import 'package:final_project/core/service/app_keys.dart';
import 'package:final_project/core/service/my_service.dart';
import 'package:http/http.dart ' as http;
import 'check_internat.dart';

class crud {
  static String message = '';
  Future<Either<StatusRequest, Map>> postData(
      String LinkUrl, Map data, Map<String, String> header) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(LinkUrl),
            body: jsonEncode(data),
            //  body: data,
            headers: header);
        print(response);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          print(response.body);
          if (responseBody.containsKey('token')) {
            var token = responseBody['token'];
            print("Token from response: $token");
            await MyService().saveStringValue(AppKeys.storeTokenkey, token);
            await MyService().setConstantToken();
          }
          return Right(responseBody);
        } else {
          var responseBody = jsonDecode(response.body);
          print("Error Response: ${responseBody}");
          if (responseBody.containsKey('message')) {
            message = responseBody['message'];
          } else {
            message = 'حدث خطأ غير معروف';
          }
          print(message);

          return const Left(StatusRequest.failure);
        }
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } catch (_) {
      print(_);
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, List<dynamic>>> getData(String linkUrl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkUrl), headers: {
          //  'authorization': 'Bearer ${ConstData.token}',
          'Accept': 'application/json'
        });
        if (response.statusCode == 200 || response.statusCode == 201) {
          //    Map responsebody = jsonDecode(response.body);
          List<dynamic> responsebody = jsonDecode(response.body);
          print("========== $responsebody ==========");
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offLineFailure);
      }
    } catch (e) {
      print(e);
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> getObject(String linkUrl,
      {Map<String, String>? headers}) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkUrl), headers: headers);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);

          // التحقق مما إذا كانت الاستجابة كائنًا
          if (responseBody is Map<String, dynamic>) {
            return Right(responseBody);
          } else {
            return const Left(StatusRequest.serverFailure);
          }
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offLineFailure);
      }
    } catch (e) {
      print(e);
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> updateData(
      String linkUrl, Map data, Map<String, String> header) async {
    try {
      if (await checkInternet()) {
        var response = await http.put(
          Uri.parse(linkUrl),
          body: jsonEncode(data),
          headers: header,
        );

        print("Update Response: $response");

        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);
          print("Update Response Body: $responseBody");
          return Right(responseBody);
        } else {
          var responseBody = jsonDecode(response.body);
          print("Update Error Response: $responseBody");

          if (responseBody.containsKey('message')) {
            message = responseBody['message'];
          } else {
            message = 'حدث خطأ أثناء التحديث';
          }

          return const Left(StatusRequest.failure);
        }
      } else {
        return const Left(StatusRequest.offLineFailure);
      }
    } catch (e) {
      print("Update Exception: $e");
      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map<String, dynamic>>> deleteData(
      String linkUrl, Map<String, String> header) async {
    try {
      if (await checkInternet()) {
        var response = await http.delete(
          Uri.parse(linkUrl),
          headers: header,
        );

        print("Delete Response: ${response.statusCode}");
        print("Delete Response Body: ${response.body}");

        if (response.statusCode == 200 || response.statusCode == 201) {
          // في حال كانت الاستجابة تحتوي على جسم (Body)
          var responseBody = jsonDecode(response.body);
          print("Delete Response Body (Decoded): $responseBody");
          return Right(responseBody);
        } else if (response.statusCode == 204) {
          // في حال كانت الاستجابة 204 No Content (لا تحتوي على محتوى)
          print("Delete success with no content (204)");
          return const Right({});
        } else {
          // في حال كانت الاستجابة تحتوي على خطأ
          var responseBody = jsonDecode(response.body);
          print("Delete Error Response Body (Decoded): $responseBody");

          if (responseBody.containsKey('message')) {
            message = responseBody['message'];
          } else {
            message = 'فشل في عملية الحذف';
          }

          return const Left(StatusRequest.failure);
        }
      } else {
        return const Left(StatusRequest.offLineFailure);
      }
    } catch (e) {
      print("Delete Exception: $e");
      return const Left(StatusRequest.serverFailure);
    }
  }
}
