import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ConstData {
  static bool isLogin = false;

  static String token = "";

  static Future<void> UpdateToken(                   ) async {
    const String clientId = '';
    const String clientSecret = '';

    final response = await http.post(
        Uri.parse('https://test.api.amadeus.com/v1/security/oauth2/token'                  ),
        headers: {
          'content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'grant_type': 'client_credentials',
          'client_id': clientId,
          'client_secret': clientSecret,
        });
    if (response.statusCode == 200                  ) {
      final Map<String, dynamic> data = json.decoder as Map<String, dynamic>;
      token = data['access_token'];
      isLogin = true;
      print('Token updated : $token'                  );
    } else {
      print('Failed to obtain access token : ${response.statusCode}'                  );
      print(' Response body : ${response.body}'                  );
    }
  }

  static Future<void> startTokenUpDater(                   ) async {
    Timer.periodic(const Duration(seconds: 20                  ), (timer) {
      UpdateToken(                   );
    });
  }
}
